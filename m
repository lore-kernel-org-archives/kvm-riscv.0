From: Jiangyifei <jiangyifei@huawei.com>
Date: Mon, 20 Dec 2021 13:02:01 +0000
Subject: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
In-Reply-To: <dec3147b-24bc-7e48-680b-a7423b0640f9@linaro.org>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-11-jiangyifei@huawei.com>
 <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
 <dec3147b-24bc-7e48-680b-a7423b0640f9@linaro.org>
Message-ID: <229748f67a154a728f149b02e1f097f9@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Richard Henderson [mailto:richard.henderson at linaro.org]
> Sent: Monday, December 13, 2021 11:20 PM
> To: Anup Patel <anup@brainfault.org>; Jiangyifei <jiangyifei@huawei.com>
> Cc: Bin Meng <bin.meng@windriver.com>; open list:RISC-V
> <qemu-riscv@nongnu.org>; limingwang (A) <limingwang@huawei.com>; KVM
> General <kvm@vger.kernel.org>; libvir-list at redhat.com; Anup Patel
> <anup.patel@wdc.com>; QEMU Developers <qemu-devel@nongnu.org>;
> wanbo (G) <wanbo13@huawei.com>; Palmer Dabbelt <palmer@dabbelt.com>;
> kvm-riscv at lists.infradead.org; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Fanliang (EulerOS) <fanliang@huawei.com>;
> Wubin (H) <wu.wubin@huawei.com>
> Subject: Re: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
> 
> On 12/12/21 9:05 PM, Anup Patel wrote:
> >> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> >> +    if (ret) {
> >> +        abort();
> >> +    }
> >> +    env->kvm_timer_state = reg;
> >
> > Please read the timer frequency here.
> 
> Yep.
> 
> >> +
> >> +    env->kvm_timer_dirty = true;
> >> +}
> >> +
> >> +static void kvm_riscv_put_regs_timer(CPUState *cs) {
> >> +    int ret;
> >> +    uint64_t reg;
> >> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> >> +
> >> +    if (!env->kvm_timer_dirty) {
> >> +        return;
> >> +    }
> >
> > Over here, we should get the timer frequency and abort() with an error
> > message if it does not match env->kvm_timer_frequency
> >
> > For now, migration will not work between Hosts with different timer
> > frequency.
> 
> You shouldn't have to do this every "put", only on migration, at which point you
> can actually signal a migration error rather than aborting directly.
> 
> 
> r~

Yes, it will be modified in the next series.

Yifei
