From: Richard Henderson <richard.henderson@linaro.org>
Date: Sat, 20 Nov 2021 23:19:07 +0100
Subject: [PATCH v1 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
In-Reply-To: <20211120074644.729-4-jiangyifei@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-4-jiangyifei@huawei.com>
Message-ID: <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/20/21 8:46 AM, Yifei Jiang wrote:
> +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa_mxl |= isa;

This doesn't look right.
I'm sure you meant

     env->misa_ext = isa;


r~

