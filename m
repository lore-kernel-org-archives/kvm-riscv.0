From: Sean Christopherson <seanjc@google.com>
Date: Mon, 30 Sep 2024 14:56:49 -0700
Subject: [PATCH v2 03/13] KVM: selftests: Fudge around an apparent gcc bug
 in arm64's PMU test
In-Reply-To: <20240911204158.2034295-4-seanjc@google.com>
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-4-seanjc@google.com>
Message-ID: <ZvseoZLzmaS4MEbc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024, Sean Christopherson wrote:
> Use u64_replace_bits() instead of u64p_replace_bits() to set PMCR.N in
> arm64's vPMU counter access test to fudge around what appears to be a gcc
> bug.  With the recent change to have vcpu_get_reg() return a value in lieu
> of an out-param, some versions of gcc completely ignore the operation
> performed by set_pmcr_n(), i.e. ignore the output param.

Filed a gcc bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116912

I'll report back if anything interesting comes out of that bug.

