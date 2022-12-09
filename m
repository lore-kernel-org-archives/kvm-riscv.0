From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 9 Dec 2022 17:31:53 +0000
Subject: [RFC PATCH 23/37] KVM: MMU: Move VM-level TDP MMU state to
 struct kvm
In-Reply-To: <20221208193857.4090582-24-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-24-dmatlack@google.com>
Message-ID: <Y5NxCYz9XV3hgGYX@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey David,

On Thu, Dec 08, 2022 at 11:38:43AM -0800, David Matlack wrote:
> Move VM-level TDP MMU state to struct kvm so it can be accessed by
> common code in a future commit.
> 
> No functional change intended.

Could you instead introduce a structure to hold all of the MMU state and
stick that in struct kvm? If the goal is to eventually supersede all
uses of the arm64 pgtable library we are going to need the ability to
operate outside of a KVM VM context.

--
Thanks,
Oliver

