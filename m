From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 10 Apr 2024 00:28:08 -0700
Subject: [PATCH v5 21/22] KVM: riscv: selftests: Add a test for PMU
 snapshot functionality
In-Reply-To: <20240410-2a41e43624596a442d6a95cd@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-22-atishp@rivosinc.com>
 <20240405-4e840120e8117c286cb593f9@orel>
 <8748dbed-d105-4f26-a808-667c3b56c8ec@rivosinc.com>
 <20240410-2a41e43624596a442d6a95cd@orel>
Message-ID: <4a428500-4e37-4e7d-968d-3da20dd822af@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 4/10/24 00:10, Andrew Jones wrote:
> On Tue, Apr 09, 2024 at 03:52:40PM -0700, Atish Patra wrote:
>> On 4/5/24 06:11, Andrew Jones wrote:
>>> On Wed, Apr 03, 2024 at 01:04:50AM -0700, Atish Patra wrote:
> ...
>>>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>>>> +	GUEST_ASSERT(probe && out_val == 1);
>>>> +
>>>> +	if (get_host_sbi_spec_version() < sbi_mk_version(2, 0))
>>>> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
>>>> +}
>>> It's a pity we can't check the SBI spec version that KVM is advertising
>>> from KVM userspace. Normally we'd want to check something like this at
>>> the start of the test with TEST_REQUIRE() before running a VCPU in order
>>> to generate a skip exit.
>>>
>> Agreed. I will send a separate series for that as it is an ABI change.
>>
>>> (We probably should allow reading and even writing the SBI spec version
>>> from the VMM in order to better support migration.)
>>>
>> How that would work for SBI spec version write use case ? For migraiton, you
>> can't go back to older SBI versions in the host. Isn't it ?
>>
>> Considering this case your VM is running with PMU snapshot as the host has
>> SBI v2.0. It can't be migrated to v1.0 and expecting it work. Correct ?
>>
> We can start a VM on a host with SBI v2.0, but tell KVM to tell the VM
> that it has v1.0. Then, the guest shouldn't use any features from SBI
> that appear after v1.0 and it should be safe to migrate to a host with
> v1.0.

That depends on when the VMM request to KVM to change the version.
Most of SBI implementation checks the SBI version at the boot and 
enable/disable
feature based on the SBI version available. If the SBI version supported 
by KVM changes
to an older one, the calls from VM will fail unexpectedly.

> A more likely scenario might be this though:
>
>   1. KVM userspace checks and captures the SBI version of the host where
>      the VM is first being launched, e.g. v2.0
>   2. The VM gets migrated to another host which supports something later,
>      e.g. v3.0, but to
>      - avoid possibly confusing the guest we tell the destination host
>        that it should expose v2.0 as the SBI version
>      - allow rollback to the source host without concern that the guest
>        has already seen v3.0 and started to use something that the
>        source can't provide

This makes sense though. As per my understanding, we should not allow 
modifying
the SBI version that is less that the version VM already boot with.
However, we can allow modifying the SBI version that is higher or same 
as the VM booted with.

I can't think of a use case for the higher version though.

> Thanks,
> drew

