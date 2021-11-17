From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 17 Nov 2021 13:12:00 +0100
Subject: [PATCH v2 6/6] KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS
In-Reply-To: <20211116163443.88707-7-vkuznets@redhat.com>
References: <20211116163443.88707-1-vkuznets@redhat.com>
 <20211116163443.88707-7-vkuznets@redhat.com>
Message-ID: <7cd420c0-4fe5-7c37-5eb8-da82b277ff60@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/16/21 17:34, Vitaly Kuznetsov wrote:
> KVM_CAP_NR_VCPUS is used to get the "recommended" maximum number of
> VCPUs and arm64/mips/riscv report num_online_cpus(). Powerpc reports
> either num_online_cpus() or num_present_cpus(), s390 has multiple
> constants depending on hardware features. On x86, KVM reports an
> arbitrary value of '710' which is supposed to be the maximum tested
> value but it's possible to test all KVM_MAX_VCPUS even when there are
> less physical CPUs available.
> 
> Drop the arbitrary '710' value and return num_online_cpus() on x86 as
> well. The recommendation will match other architectures and will mean
> 'no CPU overcommit'.
> 
> For reference, QEMU only queries KVM_CAP_NR_VCPUS to print a warning
> when the requested vCPU number exceeds it. The static limit of '710'
> is quite weird as smaller systems with just a few physical CPUs should
> certainly "recommend" less.
> 
> Suggested-by: Eduardo Habkost<ehabkost@redhat.com>
> Signed-off-by: Vitaly Kuznetsov<vkuznets@redhat.com>

Given that KVM_SOFT_MAX_VCPUS has already been dropped in 5.16, I 
changed the commit message to

     KVM: x86: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS

     It doesn't make sense to return the recommended maximum number of
     vCPUs which exceeds the maximum possible number of vCPUs.

Paolo


