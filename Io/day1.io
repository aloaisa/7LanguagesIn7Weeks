##########################################
##
## Language Io.
## - Day 1
## 	Seven Languages in seven weeks
##
###########################################

# 1º) Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly
#	typed? Support your answer with code.
1 + 1
#==> 2 

#1 + "one"
#  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
#  ---------
#  message '+' in 'Command Line' on line 1
## Then I think that this is strongly typed, we don't implicitly cast
##	 to an integer value.



# 2º) Is 0 true or false? What about the empty string? Is nil true or false?
#	Support your answer with code.

0 and true
#==> true

"" and true
#==> true

nil and true
#==> false
nil and false
#==> false
nil or true
#==> true
nil or false
#==> false
## Then I think that nil is neither true nor false.



# 3º) How can you tell what slots a prototype supports?
Object slotNames
##==> list(slotSummary, try, and, apropos, foreachSlot, performWithArgList, 
# coroWith, <, actorRun, removeAllSlots, for, isTrue, clone, become, !=, 
# write, switch, setSlotWithType, method, ancestors, futureSend, resend, 
# isActivatable, lazySlot, list, serializedSlotsWithNames, coroDoLater, 
# evalArg, uniqueId, @@, do, ownsSlots, deprecatedWarning, setProto, 
# println, hasProto, writeln, setSlot, handleActorException, newSlot, 
# ifNonNil, message, isKindOf, removeAllProtos, coroFor, pause, continue, 
# ifNil, stopStatus, prependProto, ancestorWithSlot, print, inlineMethod, 
# evalArgAndReturnSelf, doString, type, ?, return, break, >, justSerialized, 
# ==, currentCoro, slotNames, serializedSlots, hasLocalSlot, serialized, 
# while, perform, ifNonNilEval, wait, asString, returnIfNonNil, getLocalSlot, 
# or, getSlot, yield, asSimpleString, loop, hasDirtySlot, thisContext, 
# removeProto, appendProto, in, isNil, uniqueHexId, shallowCopy, lexicalDo, 
# not, .., doRelativeFile, compare, launchFile, , returnIfError, raiseIfError, 
# ifNilEval, init, isError, evalArgAndReturnNil, doFile, argIsActivationRecord, 
# ifError, isIdenticalTo, super, isLaunchScript, slotDescriptionMap, 
# cloneWithoutInit, hasSlot, contextWithSlot, thisLocalContext, >=, if, 
# relativeDoFile, memorySize, <=, asyncSend, thisMessage, @, markClean, 
# coroDo, slotValues, -, doMessage, proto, setIsActivatable, updateSlot, 
# removeSlot, protos, block, actorProcessQueue, setProtos, argIsCall)

## Using slotNames


# 4º) What is the difference between = (equals), := (colon equals), and ::=
# (colon colon equals)? When would you use each one?
#Vehicle = Object clone
#  Exception: Slot Vehicle not found. Must define slot using := operator before updating.
#  ---------
#  message 'updateSlot' in 'Command Line' on line 1

# This error is because you need initialice first Vehicle to use with =
# You must use := to initialice an Object.
Vehicle := Object clone
#==>  Vehicle_0x849c738:
#  type             = "Vehicle"

New := Vehicle clone     
#==>  Vehicle_0x857ed98:
New new ::= "hola"
#==> hola
New slotNames
#==> list(setNew, new)
## :== is equal to := but add a setter to the slot


#Do:
# 1º) Run an Io program from a file.
## You can execute this file with the next command:
# io day1.io 


# 2º) Execute the code in a slot given its name.

yourName := method(
	writeln ("What's your name?"); 
	name := File standardInput readLine ("#: ");
	writeln ("Hello ", name)
)


#Spend a little time playing with slots and prototypes. Make sure you
#understand how prototypes work.





