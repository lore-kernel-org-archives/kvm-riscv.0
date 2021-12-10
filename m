From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Dec 2021 11:11:24 +0100
Subject: [PATCH v1 12/12] target/riscv: Support virtual time context
 synchronization
In-Reply-To: <d9c9196a-692c-cbcf-339b-8e84ecde7cee@linaro.org>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-13-jiangyifei@huawei.com>
 <d9c9196a-692c-cbcf-339b-8e84ecde7cee@linaro.org>
Message-ID: <02a0ad69-4129-6e6c-06af-fc9c9e3047e1@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/20/21 23:34, Richard Henderson wrote:
> On 11/20/21 8:46 AM, Yifei Jiang wrote:
>> ? const VMStateDescription vmstate_riscv_cpu = {
>> ????? .name = "cpu",
>> ????? .version_id = 3,
>> ????? .minimum_version_id = 3,
>> +??? .post_load = cpu_post_load,
>> ????? .fields = (VMStateField[]) {
>> ????????? VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>> ????????? VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
>> @@ -211,6 +221,10 @@ const VMStateDescription vmstate_riscv_cpu = {
>> ????????? VMSTATE_UINT64(env.mtohost, RISCVCPU),
>> ????????? VMSTATE_UINT64(env.timecmp, RISCVCPU),
>> +??????? VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>> +??????? VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
>> +??????? VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
>> +
>> ????????? VMSTATE_END_OF_LIST()
>> ????? },
> 
> Can't alter VMStateDescription.fields without bumping version.
> 
> If this is really kvm-only state, consider placing it into a 
> subsection.? But I worry about kvm-only state because ideally we'd be 
> able to migrate between tcg and kvm (if only for debugging).

Where is this state stored for TCG?

Paolo

