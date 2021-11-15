From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Mon, 15 Nov 2021 17:04:01 +0100
Subject: [PATCH 0/5] KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS and
 re-purpose it on x86
In-Reply-To: <ecd55383-7089-b3cd-30cc-3f9feb7eadb4@de.ibm.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <4a3c7be7-12fa-6e47-64eb-02e6c5be5dbc@redhat.com>
 <ecd55383-7089-b3cd-30cc-3f9feb7eadb4@de.ibm.com>
Message-ID: <877dd9pfri.fsf@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> Am 11.11.21 um 17:32 schrieb Paolo Bonzini:
>> On 11/11/21 17:27, Vitaly Kuznetsov wrote:
>>> This is a comtinuation of "KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS"
>>> (https://lore.kernel.org/kvm/20211111134733.86601-1-vkuznets at redhat.com/)
>>> work.
>>>
>>> 1) Enforce KVM_CAP_NR_VCPUS <= KVM_CAP_MAX_VCPUS rule on all
>>> ? architectures. [Sean Christopherson]
>>> 2) Make KVM_CAP_NR_VCPUS return num_online_cpus() and not an arbitrary
>>> ? value of '710' on x86.
>>>
>>> Everything but x86 was only 'eyeball tested', the change is trivial
>>> but sorry in advance if I screwed up)
>> 
>> Christian, can you look at this for s390?? Returning a fixed value seems wrong for KVM_CAP_NR_VCPUS.
>
> If we talk about recommended number, then num_online_cpus() also seems to make sense on s390 so
> if you change that for s390 as well I can ACK this.

Thanks!

For KVM_CAP_MAX_VCPUS s390 code returns one of the three things:
KVM_S390_BSCA_CPU_SLOTS(64), KVM_MAX_VCPUS(255) or
KVM_S390_ESCA_CPU_SLOTS(248).

For KVM_CAP_NR_VCPUS, would it be better to return raw
num_online_cpus():

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 6a6dd5e1daf6..fcecbb762a1a 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -578,6 +578,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
                r = MEM_OP_MAX_SIZE;
                break;
        case KVM_CAP_NR_VCPUS:
+               r = num_online_cpus();
+               break;
        case KVM_CAP_MAX_VCPUS:
        case KVM_CAP_MAX_VCPU_ID:
                r = KVM_S390_BSCA_CPU_SLOTS;

or cap KVM_CAP_MAX_VCPUS value with num_online_cpus(), e.g.

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 6a6dd5e1daf6..1cfe36f6432e 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -585,6 +585,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
                        r = KVM_MAX_VCPUS;
                else if (sclp.has_esca && sclp.has_64bscao)
                        r = KVM_S390_ESCA_CPU_SLOTS;
+               if (ext == KVM_CAP_NR_VCPUS)
+                       r = min_t(unsigned int, num_online_cpus(), r);
                break;
        case KVM_CAP_S390_COW:
                r = MACHINE_HAS_ESOP;

For reference, see our ARM discussion:
https://lore.kernel.org/kvm/20211111162746.100598-2-vkuznets at redhat.com/
though 390's situation is different, the returned value for
KVM_CAP_MAX_VCPUS is not VM-dependent.

-- 
Vitaly


