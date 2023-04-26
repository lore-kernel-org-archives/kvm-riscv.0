From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 26 Apr 2023 17:21:58 +0000
Subject: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
References: <20230306190156.434452-1-dmatlack@google.com>
Message-ID: <ZEldtrUVBgmlrFOl@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 06, 2023 at 11:01:52AM -0800, David Matlack wrote:
> This series refactors the KVM stats macros to reduce duplication and
> adds the support for choosing custom names for stats.
> 
> Custom name makes it possible to decouple the userspace-visible stat
> names from their internal representation in C. This can allow future
> commits to refactor the various stats structs without impacting
> userspace tools that read KVM stats.
> 
> This also allows stats to be stored in data structures such as arrays,
> without needing unions to access specific stats. Case in point, the last
> patch in this series removes the pages_{4k,2m,1g} union, which is a
> useful cleanup to prepare for sharing paging code across architectures
> [1].
> 
> And for full transparency, another motivation for this series it that at
> Google we have several out-of-tree stats that use arrays. Custom name
> support is something we added internally and it reduces our technical
> debt to get the support merged upstream.

For the series:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

