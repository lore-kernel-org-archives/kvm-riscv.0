From: Jiangyifei <jiangyifei@huawei.com>
Date: Fri, 10 Dec 2021 09:55:08 +0000
Subject: [PATCH v1 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
In-Reply-To: <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-4-jiangyifei@huawei.com>
 <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
Message-ID: <8e09fe10ba1a4062831b934a836ff861@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Richard Henderson [mailto:richard.henderson at linaro.org]
> Sent: Sunday, November 21, 2021 6:19 AM
> To: Jiangyifei <jiangyifei@huawei.com>; qemu-devel at nongnu.org;
> qemu-riscv at nongnu.org
> Cc: bin.meng at windriver.com; limingwang (A) <limingwang@huawei.com>;
> kvm at vger.kernel.org; libvir-list at redhat.com; anup.patel at wdc.com; wanbo (G)
> <wanbo13@huawei.com>; Alistair Francis <alistair.francis@wdc.com>;
> kvm-riscv at lists.infradead.org; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>; palmer at dabbelt.com; Fanliang (EulerOS)
> <fanliang@huawei.com>; Wubin (H) <wu.wubin@huawei.com>
> Subject: Re: [PATCH v1 03/12] target/riscv: Implement function
> kvm_arch_init_vcpu
> 
> On 11/20/21 8:46 AM, Yifei Jiang wrote:
> > +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> KVM_REG_RISCV_CONFIG_REG(isa));
> > +    ret = kvm_get_one_reg(cs, id, &isa);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    env->misa_mxl |= isa;
> 
> This doesn't look right.
> I'm sure you meant
> 
>      env->misa_ext = isa;
> 
> 
> r~

Thanks, it will be modified in the next series.

Yifei
