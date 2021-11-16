From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Tue, 16 Nov 2021 09:15:43 +0100
Subject: [PATCH 0/5] KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS and
 re-purpose it on x86
In-Reply-To: <877dd9pfri.fsf@redhat.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <4a3c7be7-12fa-6e47-64eb-02e6c5be5dbc@redhat.com>
 <ecd55383-7089-b3cd-30cc-3f9feb7eadb4@de.ibm.com> <877dd9pfri.fsf@redhat.com>
Message-ID: <d7547cab-88d6-18a9-8307-bf2cc5d61163@de.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



Am 15.11.21 um 17:04 schrieb Vitaly Kuznetsov:
[...]
> or cap KVM_CAP_MAX_VCPUS value with num_online_cpus(), e.g.
> 
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 6a6dd5e1daf6..1cfe36f6432e 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -585,6 +585,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>                          r = KVM_MAX_VCPUS;
>                  else if (sclp.has_esca && sclp.has_64bscao)
>                          r = KVM_S390_ESCA_CPU_SLOTS;
> +               if (ext == KVM_CAP_NR_VCPUS)
> +                       r = min_t(unsigned int, num_online_cpus(), r);
>                  break;
>          case KVM_CAP_S390_COW:
>                  r = MACHINE_HAS_ESOP;

Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>


I think this is the better variant. Thanks.

