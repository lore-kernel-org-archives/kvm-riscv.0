From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Nov 2021 11:51:54 +0100
Subject: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <20211112103851.pmb35qf5bvcukjmg@gator.home>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
 <a5cdff6878b7157587e92ebe4d5af362@kernel.org> <875ysxg0s1.fsf@redhat.com>
 <20211112103851.pmb35qf5bvcukjmg@gator.home>
Message-ID: <ff2ab085-bde9-5d88-e8ce-aa92c165361a@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/12/21 11:38, Andrew Jones wrote:
>>
>> I'd like KVM to be consistent across architectures and have the same
>> (similar) meaning for KVM_CAP_NR_VCPUS.
> KVM_CAP_NR_VCPUS seems pretty useless if we just want to tell userspace
> the same thing it can get with _SC_NPROCESSORS_ONLN. In fact, if userspace
> knows something we don't about the future onlining of some pcpus, then
> maybe userspace would prefer to check _SC_NPROCESSORS_CONF.

It's the same for most architectures, but for example PPC has to take 
into account the handling of threads, which can exist while the VMs run 
but not in the host.  So KVM_CAP_NR_VCPUS on PPC is _SC_NPROCESSORS_CONF 
times the number of threads per core.

If you don't count PPC (not sure about s390), it _is_ pretty useless indeed.

Paolo


