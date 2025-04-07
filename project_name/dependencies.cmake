message(STATUS "[${CURRENT_TARGET}] Getting dependencies.")

set(TARGET_PUBLIC_DEPENDENCIES
)

set(TARGET_PRIVATE_DEPENDENCIES
	onyx-application
	onyx-editor
	onyx-profiler
)
message(STATUS "[${CURRENT_TARGET}] Finished getting dependencies.")
