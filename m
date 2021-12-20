From: Jiangyifei <jiangyifei@huawei.com>
Date: Mon, 20 Dec 2021 13:02:53 +0000
Subject: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
In-Reply-To: <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
 <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
Message-ID: <93bc5000c51042e5bb45053707109947@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Richard Henderson [mailto:richard.henderson at linaro.org]
> Sent: Monday, December 13, 2021 11:22 PM
> To: Jiangyifei <jiangyifei@huawei.com>; qemu-devel at nongnu.org;
> qemu-riscv at nongnu.org
> Cc: kvm-riscv at lists.infradead.org; kvm at vger.kernel.org;
> libvir-list at redhat.com; anup.patel at wdc.com; palmer at dabbelt.com;
> Alistair.Francis at wdc.com; bin.meng at windriver.com; Fanliang (EulerOS)
> <fanliang@huawei.com>; Wubin (H) <wu.wubin@huawei.com>; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>; wanbo (G) <wanbo13@huawei.com>;
> limingwang (A) <limingwang@huawei.com>
> Subject: Re: [PATCH v2 12/12] target/riscv: Support virtual time context
> synchronization
> 
> On 12/10/21 2:07 AM, Yifei Jiang via wrote:
> > +static bool kvmtimer_needed(void *opaque) {
> > +    return kvm_enabled();
> > +}
> > +
> > +
> > +static const VMStateDescription vmstate_kvmtimer = {
> > +    .name = "cpu/kvmtimer",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .needed = kvmtimer_needed,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> > +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> > +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> > +
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static int cpu_post_load(void *opaque, int version_id) {
> > +    RISCVCPU *cpu = opaque;
> > +    CPURISCVState *env = &cpu->env;
> > +
> > +    if (kvm_enabled()) {
> > +        env->kvm_timer_dirty = true;
> > +    }
> > +    return 0;
> > +}
> 
> This post-load belongs on the vmstate_kvmtimer struct, so that you need not
> re-check kvm_enabled().
> 
> >   const VMStateDescription vmstate_riscv_cpu = {
> >       .name = "cpu",
> > -    .version_id = 3,
> > -    .minimum_version_id = 3,
> > +    .version_id = 4,
> > +    .minimum_version_id = 4,
> > +    .post_load = cpu_post_load,
> 
> No need for version change.
> 
> 
> r~

Ok, it will be modified in the next series.

Yifei
