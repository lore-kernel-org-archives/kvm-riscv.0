From: Anish Moorthy <amoorthy@google.com>
Date: Thu, 5 Oct 2023 15:07:19 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <ZRyn0nPQpbVpz8ah@google.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com> <ZQ3AmLO2SYv3DszH@google.com>
 <CAF7b7mrf-y9DNdsreOAedGJueOThnYE=ascFd4=rvW0Z4rhTQg@mail.gmail.com>
 <ZRtxoaJdVF1C2Mvy@google.com> <CAF7b7mqyU059YpBBVYjTMNXf9VHSc6tbKrQ8avFXYtP6LWMh8Q@mail.gmail.com>
 <ZRyn0nPQpbVpz8ah@google.com>
Message-ID: <CAF7b7mqYr0J-J2oaU=c-dzLys-m6Ttp7ZOb3Em7n1wUj3rhh+A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 3, 2023 at 4:46?PM Sean Christopherson <seanjc@google.com> wrote:
>
> The only way a KVM_EXIT_MEMORY_FAULT that actually reaches userspace could be
> "unreliable" is if something other than a memory_fault exit clobbered the union,
> but didn't signal its KVM_EXIT_* reason.  And that would be an egregious bug that
> isn't unique to KVM_EXIT_MEMORY_FAULT, i.e. the same data corruption would affect
> each and every other KVM_EXIT_* reason.

Keep in mind the case where an "unreliable" annotation sets up a
KVM_EXIT_MEMORY_FAULT, KVM_RUN ends up continuing, then something
unrelated comes up and causes KVM_RUN to EFAULT. Although this at
least is a case of "outdated" information rather than blatant
corruption.

IIRC the last time this came up we said that there's minimal harm in
userspace acting on the outdated info, but it seems like another good
argument for just restricting the annotations to paths we know are
reliable. What if the second EFAULT above is fatal (as I understand
all are today) and sets up subsequent KVM_RUNs to crash and burn
somehow? Seems like that'd be a safety issue.

