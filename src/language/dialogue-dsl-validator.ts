import type {  ValidationChecks } from 'langium';
import type { DialogueDslAstType } from './generated/ast.js';
import type { DialogueDslServices } from './dialogue-dsl-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: DialogueDslServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.DialogueDslValidator;
    const checks: ValidationChecks<DialogueDslAstType> = {
        // Person: validator.checkPersonStartsWithCapital
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class DialogueDslValidator {

    // checkPersonStartsWithCapital(person: Person, accept: ValidationAcceptor): void {
    //     if (person.name) {
    //         const firstChar = person.name.substring(0, 1);
    //         if (firstChar.toUpperCase() !== firstChar) {
    //             accept('warning', 'Person name should start with a capital.', { node: person, property: 'name' });
    //         }
    //     }
    // }

}
