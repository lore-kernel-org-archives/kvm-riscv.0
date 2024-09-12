From: Sean Christopherson <seanjc@google.com>
Date: Thu, 12 Sep 2024 06:49:40 -0700
Subject: [PATCH v2 02/13] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <20240912-a3894135370bf3fe551ed018@orel>
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-3-seanjc@google.com>
 <20240912-a3894135370bf3fe551ed018@orel>
Message-ID: <ZuLxIjMT4QzrUaad@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, Andrew Jones wrote:
> On Wed, Sep 11, 2024 at 01:41:47PM GMT, Sean Christopherson wrote:
> > Return a uint64_t from vcpu_get_reg() instead of having the caller provide
> > a pointer to storage, as none of the KVM_GET_ONE_REG usage in KVM selftests
> 
> "none of the vcpu_get_reg() usage"
> 
> (There is KVM_GET_ONE_REG usage accessing larger registers, but those are
>  done through __vcpu_get_reg(). See get-reg-list.c)

Doh, right, which was also part of my reasoning for making the conversion (tests
can use __vcpu_get_reg() if they need to get a larger register).

