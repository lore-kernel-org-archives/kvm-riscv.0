From: Thomas Huth <thuth@redhat.com>
Date: Wed, 4 Sep 2024 08:12:08 +0200
Subject: [kvm-unit-tests PATCH 3/3] riscv: gitlab-ci: Add clang build
 tests
In-Reply-To: <20240903163046.869262-8-andrew.jones@linux.dev>
References: <20240903163046.869262-5-andrew.jones@linux.dev>
 <20240903163046.869262-8-andrew.jones@linux.dev>
Message-ID: <425f68ae-5d63-412d-a677-82d91b2d9935@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/09/2024 18.30, Andrew Jones wrote:
> Test building 32 and 64-bit with clang. Throw a test of in- and out-
> of-tree building in too by swapping which is done to which (32-bit
> vs. 64-bit) with respect to the gcc build tests.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>


