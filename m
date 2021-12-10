From: Jiangyifei <jiangyifei@huawei.com>
Date: Fri, 10 Dec 2021 10:02:05 +0000
Subject: [PATCH v1 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
In-Reply-To: <afe5b14f-ec27-2722-73a8-b9f6716d207e@amsat.org>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-9-jiangyifei@huawei.com>
 <afe5b14f-ec27-2722-73a8-b9f6716d207e@amsat.org>
Message-ID: <8722f544a1d747f6937dccf0b4272779@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Philippe Mathieu-Daud? [mailto:philippe.mathieu.daude at gmail.com]
> On Behalf Of Philippe Mathieu-Daud?
> Sent: Saturday, November 20, 2021 8:25 PM
> To: Jiangyifei <jiangyifei@huawei.com>; qemu-devel at nongnu.org;
> qemu-riscv at nongnu.org
> Cc: bin.meng at windriver.com; limingwang (A) <limingwang@huawei.com>;
> kvm at vger.kernel.org; libvir-list at redhat.com; anup.patel at wdc.com; wanbo (G)
> <wanbo13@huawei.com>; Alistair.Francis at wdc.com;
> kvm-riscv at lists.infradead.org; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>; palmer at dabbelt.com; Fanliang (EulerOS)
> <fanliang@huawei.com>; Wubin (H) <wu.wubin@huawei.com>; Alex Benn?e
> <alex.bennee@linaro.org>
> Subject: Re: [PATCH v1 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
> 
> Hi,
> 
> On 11/20/21 08:46, Yifei Jiang wrote:
> > Use char-fe to handle console sbi call, which implement early console
> > io while apply 'earlycon=sbi' into kernel parameters.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > ---
> >  target/riscv/kvm.c                 | 42 ++++++++++++++++-
> >  target/riscv/sbi_ecall_interface.h | 72
> > ++++++++++++++++++++++++++++++
> >  2 files changed, 113 insertions(+), 1 deletion(-)  create mode 100644
> > target/riscv/sbi_ecall_interface.h
> >
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > 8da2648d1a..6d419ba02e 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -38,6 +38,8 @@
> >  #include "qemu/log.h"
> >  #include "hw/loader.h"
> >  #include "kvm_riscv.h"
> > +#include "sbi_ecall_interface.h"
> > +#include "chardev/char-fe.h"
> >
> >  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
> > uint64_t idx)  { @@ -440,9 +442,47 @@ bool
> > kvm_arch_stop_on_emulation_error(CPUState *cs)
> >      return true;
> >  }
> >
> > +static int kvm_riscv_handle_sbi(struct kvm_run *run) {
> > +    int ret = 0;
> > +    unsigned char ch;
> > +    switch (run->riscv_sbi.extension_id) {
> > +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> > +        ch = run->riscv_sbi.args[0];
> > +        qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
> > +        break;
> > +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> > +        ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
> > +        if (ret == sizeof(ch)) {
> > +            run->riscv_sbi.args[0] = ch;
> > +        } else {
> > +            run->riscv_sbi.args[0] = -1;
> > +        }
> > +        break;
> 
> Shouldn't this code use the Semihosting Console API from
> "semihosting/console.h" instead?

Thanks, I will use this API in the next series.

Yifei
