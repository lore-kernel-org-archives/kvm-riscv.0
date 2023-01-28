From: Conor Dooley <conor@kernel.org>
Date: Sat, 28 Jan 2023 10:28:26 +0000
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-next_v13_02/19=5D_riscv=3A_Exte?= =?US-ASCII?Q?nding_cpufeature=2Ec_to_detect_V-extension?=
In-Reply-To: <CAJF2gTS11DcKuSBRQfn9AkU0YP=ry-FV=cH=Au5m3Us=1gVTQQ@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-3-andy.chiu@sifive.com> <Y9GgKiF8q2k9eRdh@spud> <CAJF2gTS11DcKuSBRQfn9AkU0YP=ry-FV=cH=Au5m3Us=1gVTQQ@mail.gmail.com>
Message-ID: <3AE48592-5756-4D49-B860-1D8C54ACFF3A@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 28 January 2023 07:09:18 GMT, Guo Ren <guoren@kernel.org> wrote:
>On Thu, Jan 26, 2023 at 5:33 AM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Wed, Jan 25, 2023 at 02:20:39PM +0000, Andy Chiu wrote:
>> > From: Guo Ren <ren_guo@c-sky.com>
>> >
>> > Add V-extension into riscv_isa_ext_keys array and detect it with isa
>> > string parsing.
>> >
>> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>> > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
>> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>> > ---
>> >  arch/riscv/include/asm/hwcap.h      |  4 ++++
>> >  arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
>> >  arch/riscv/include/uapi/asm/hwcap.h |  1 +
>> >  arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
>> >  4 files changed, 43 insertions(+)
>> >  create mode 100644 arch/riscv/include/asm/vector.h
>> >
>> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> > index 57439da71c77..f413db6118e5 100644
>> > --- a/arch/riscv/include/asm/hwcap.h
>> > +++ b/arch/riscv/include/asm/hwcap.h
>> > @@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
>> >  #define RISCV_ISA_EXT_m              ('m' - 'a')
>> >  #define RISCV_ISA_EXT_s              ('s' - 'a')
>> >  #define RISCV_ISA_EXT_u              ('u' - 'a')
>> > +#define RISCV_ISA_EXT_v              ('v' - 'a')
>> >
>> >  /*
>> >   * Increse this to higher value as kernel support more ISA extensions.
>> > @@ -73,6 +74,7 @@ static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
>> >  enum riscv_isa_ext_key {
>> >       RISCV_ISA_EXT_KEY_FPU,          /* For 'F' and 'D' */
>> >       RISCV_ISA_EXT_KEY_SVINVAL,
>> > +     RISCV_ISA_EXT_KEY_VECTOR,       /* For 'V' */
>>
>> That's obvious surely, no?
>>
>> >       RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>> >       RISCV_ISA_EXT_KEY_MAX,
>> >  };
>> > @@ -95,6 +97,8 @@ static __always_inline int riscv_isa_ext2key(int num)
>>
>> You should probably check out Jisheng's series that deletes whole
>> sections of this code, including this whole function.
>> https://lore.kernel.org/all/20230115154953.831-3-jszhang at kernel.org/T/#u
>Has that patch merged? It could be solved during the rebase for-next naturally.

Not merged yet. Pretty sure Andy used for-next
as his base so that CI could test it more easily
I was just pointing out it's existence in case he
hadn't seen it.
Hopefully Jishengs stuff will make 6.3 :)

>
>>
>>
>> > @@ -256,6 +257,17 @@ void __init riscv_fill_hwcap(void)
>> >               elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
>> >       }
>> >
>> > +     if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
>> > +#ifndef CONFIG_RISCV_ISA_V
>> > +             /*
>> > +              * ISA string in device tree might have 'v' flag, but
>> > +              * CONFIG_RISCV_ISA_V is disabled in kernel.
>> > +              * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
>> > +              */
>> > +             elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
>> > +#endif
>       if (elf_hwcap & COMPAT_HWCAP_ISA_V && !IS_ENABLED(CONFIG_RISCV_ISA_V)) {
>
>right?
>>
>> I know that a later patch in this series calls rvv_enable() here, which
>> I'll comment on there, but I'd rather see IS_ENABLED as opposed to
>> ifdefs in C files where possible.
>>
>> Thanks,
>> Conor.
>>
>
>

