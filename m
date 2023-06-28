From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Tue, 27 Jun 2023 18:56:30 -0700 (PDT)
Subject: [PATCH -next v21 03/27] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
In-Reply-To: <8af3e53a-ead7-4568-a0f1-2829f5d174e6@app.fastmail.com>
Message-ID: <mhng-97928779-5d76-4390-a84c-398fdc6a0a4f@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 27 Jun 2023 17:30:33 PDT (-0700), sorear at fastmail.com wrote:
> On Mon, Jun 5, 2023, at 7:07 AM, Andy Chiu wrote:
>> Probing kernel support for Vector extension is available now. This only
>> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>>
>> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> Changelog v20:
>>  - Fix a typo in document, and remove duplicated probes (Heiko)
>>  - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
>>    Evan)
>> ---
>>  Documentation/riscv/hwprobe.rst       | 3 +++
>>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>  arch/riscv/kernel/sys_riscv.c         | 4 ++++
>>  3 files changed, 8 insertions(+)
>>
>> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
>> index 9f0dd62dcb5d..7431d9d01c73 100644
>> --- a/Documentation/riscv/hwprobe.rst
>> +++ b/Documentation/riscv/hwprobe.rst
>> @@ -64,6 +64,9 @@ The following keys are defined:
>>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
>>      by version 2.2 of the RISC-V ISA manual.
>>
>> +  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
>> +    version 1.0 of the RISC-V Vector extension manual.
>> +
>>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>>    information about the selected set of processors.
>>
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h
>> b/arch/riscv/include/uapi/asm/hwprobe.h
>> index 8d745a4ad8a2..7c6fdcf7ced5 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -25,6 +25,7 @@ struct riscv_hwprobe {
>>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>>  #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>>  #define		RISCV_HWPROBE_IMA_C		(1 << 1)
>> +#define		RISCV_HWPROBE_IMA_V		(1 << 2)
>>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>> diff --git a/arch/riscv/kernel/sys_riscv.c
>> b/arch/riscv/kernel/sys_riscv.c
>> index 5db29683ebee..88357a848797 100644
>> --- a/arch/riscv/kernel/sys_riscv.c
>> +++ b/arch/riscv/kernel/sys_riscv.c
>> @@ -10,6 +10,7 @@
>>  #include <asm/cpufeature.h>
>>  #include <asm/hwprobe.h>
>>  #include <asm/sbi.h>
>> +#include <asm/vector.h>
>>  #include <asm/switch_to.h>
>>  #include <asm/uaccess.h>
>>  #include <asm/unistd.h>
>> @@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe
>> *pair,
>>  		if (riscv_isa_extension_available(NULL, c))
>>  			pair->value |= RISCV_HWPROBE_IMA_C;
>>
>> +		if (has_vector())
>> +			pair->value |= RISCV_HWPROBE_IMA_V;
>> +
>>  		break;
>
> I am concerned by the exception this is making.  I believe the intention of
> riscv_hwprobe is to replace AT_HWCAP as the single point of truth for userspace
> to make instruction use decisions.  Since this does not check riscv_v_vstate_ctrl_user_allowed,
> application code which wants to know if V instructions are usable must use
> AT_HWCAP instead, unlike all other extensions for which the relevant data is
> available within the hwprobe return.

I guess we were vague in the docs about what "supported" means, but IIRC 
the goal was for riscv_hwprobe() to indicate what's supported by both 
the HW and the kernel.  In other words, hwprobe should indicate what's 
possible to enable -- even if there's some additional steps necessary to 
enable it.

We can at least make this a little more explicit with something like

    diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
    index 19165ebd82ba..7f82a5385bc3 100644
    --- a/Documentation/riscv/hwprobe.rst
    +++ b/Documentation/riscv/hwprobe.rst
    @@ -27,6 +27,13 @@ AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
     0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
     this value must be zero for future compatibility.
     
    +Calls to `sys_riscv_hwprobe()` indicate the features supported by both the
    +kernel and the hardware that the system is running on.  For example, if the
    +hardware supports the V extension and the kernel has V support enabled then
    +`RISCV_HWPROBE_KEY_IMA_EXT_0`/`RISCV_HWPROBE_IMA_V` will be set even if the V
    +extension is disabled via a userspace-controlled tunable such as
    +`PR_RISCV_V_SET_CONTROL`.
    +
     On success 0 is returned, on failure a negative error code is returned.
     
     The following keys are defined:
    @@ -65,7 +72,10 @@ The following keys are defined:
         by version 2.2 of the RISC-V ISA manual.
     
       * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
    -    version 1.0 of the RISC-V Vector extension manual.
    +    version 1.0 of the RISC-V Vector extension manual.  For strict uABI
    +    compatibility some systems may disable V by default even when the hardware
    +    supports in, in which case users must call `prctl(PR_RISCV_V_SET_CONTROL,
    +    ...` to explicitly allow V to be used.
     
       * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
            supported, as defined in version 1.0 of the Bit-Manipulation ISA

IMO that's the better way to go that to require that userspace tries to enable
V via the prctl() first, but we haven't released this yet so in theory we could
still change it.

We'd have a similar discussion for some of the counters that need to feed
through the perf interface, though those are still in flight...

> Assuming this is intentional, what is the path forward for future extensions
> that cannot be used from userspace without additional conditions being met?
> For instance, if we add support in the future for the Zve* extensions, the V
> bit would not be set in HWCAP for them, which would require library code to
> use the prctl interface unless we define the hwcap bits to imply userspace
> usability.

In this case a system that supports some of the Zve extensions but not 
the full V extension would not be probably from userspace, as V would 
not be set anywhere.  The way to support that would be to add new bits 
into hwprobe to indicate those extensions, it just wasn't clear that 
anyone was interested in building Linux-flavored systems that supported 
only some a strict subset of V.

Happy to see patches if you know of some hardware in the pipeline, though ;)

>
> -s
>
>>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

