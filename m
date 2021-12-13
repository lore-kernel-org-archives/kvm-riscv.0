From: Richard Henderson <richard.henderson@linaro.org>
Date: Mon, 13 Dec 2021 07:19:43 -0800
Subject: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
In-Reply-To: <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-11-jiangyifei@huawei.com>
 <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
Message-ID: <dec3147b-24bc-7e48-680b-a7423b0640f9@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/12/21 9:05 PM, Anup Patel wrote:
>> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
>> +    if (ret) {
>> +        abort();
>> +    }
>> +    env->kvm_timer_state = reg;
> 
> Please read the timer frequency here.

Yep.

>> +
>> +    env->kvm_timer_dirty = true;
>> +}
>> +
>> +static void kvm_riscv_put_regs_timer(CPUState *cs)
>> +{
>> +    int ret;
>> +    uint64_t reg;
>> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
>> +
>> +    if (!env->kvm_timer_dirty) {
>> +        return;
>> +    }
> 
> Over here, we should get the timer frequency and abort() with an
> error message if it does not match env->kvm_timer_frequency
> 
> For now, migration will not work between Hosts with different
> timer frequency.

You shouldn't have to do this every "put", only on migration, at which point you can 
actually signal a migration error rather than aborting directly.


r~

