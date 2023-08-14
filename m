From: Sean Christopherson <seanjc@google.com>
Date: Mon, 14 Aug 2023 16:16:53 -0700
Subject: [PATCH v9 00/14] KVM: arm64: Add support for FEAT_TLBIRANGE
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
References: <20230811045127.3308641-1-rananta@google.com>
Message-ID: <ZNq15SZ+53umvOfx@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> The series is based off of upstream v6.5-rc1.

Lies!  :-)

This is based off one of the kvmarm.git topic branches (I didn't bother to figure
out which one), not v6.5-rc1.

Please try to incorporate git format-patch's "--base" option into your workflow,
e.g. I do "git format-patch --base=HEAD~$nr" where $nr is the number of patches
I am posting.

It's not foolproof, e.g. my approach doesn't help if I have a local patch that
I'm not posting, but 99% of the time it Just Works and eliminates any ambuitity.

You can also do "--base=auto", but that only does the right thing if your series
has its upstream branch set to the base/tree that you want your patches applied
to (I use the upstream branch for a completely different purpose for my dev branches).

