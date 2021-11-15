From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Mon, 15 Nov 2021 13:33:56 +0100
Subject: [PATCH 0/5] KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS and
 re-purpose it on x86
In-Reply-To: <4a3c7be7-12fa-6e47-64eb-02e6c5be5dbc@redhat.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <4a3c7be7-12fa-6e47-64eb-02e6c5be5dbc@redhat.com>
Message-ID: <ecd55383-7089-b3cd-30cc-3f9feb7eadb4@de.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am 11.11.21 um 17:32 schrieb Paolo Bonzini:
> On 11/11/21 17:27, Vitaly Kuznetsov wrote:
>> This is a comtinuation of "KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS"
>> (https://lore.kernel.org/kvm/20211111134733.86601-1-vkuznets at redhat.com/)
>> work.
>>
>> 1) Enforce KVM_CAP_NR_VCPUS <= KVM_CAP_MAX_VCPUS rule on all
>> ? architectures. [Sean Christopherson]
>> 2) Make KVM_CAP_NR_VCPUS return num_online_cpus() and not an arbitrary
>> ? value of '710' on x86.
>>
>> Everything but x86 was only 'eyeball tested', the change is trivial
>> but sorry in advance if I screwed up)
> 
> Christian, can you look at this for s390?? Returning a fixed value seems wrong for KVM_CAP_NR_VCPUS.

If we talk about recommended number, then num_online_cpus() also seems to make sense on s390 so
if you change that for s390 as well I can ACK this.

