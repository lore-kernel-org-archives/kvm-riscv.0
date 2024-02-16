From: Thomas Huth <thuth@redhat.com>
Date: Fri, 16 Feb 2024 12:15:35 +0100
Subject: [kvm-unit-tests PATCH v4 8/8] migration: add a migration selftest
In-Reply-To: <20240209091134.600228-9-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
Message-ID: <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Add a selftest for migration support in  guest library and test harness
> code. It performs migrations in a tight loop to irritate races and bugs
> in the test harness code.
> 
> Include the test in arm, s390, powerpc.
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arm/Makefile.common          |  1 +
>   arm/selftest-migration.c     |  1 +
>   arm/unittests.cfg            |  6 ++++++

  Hi Nicholas,

I just gave the patches a try, but the arm test seems to fail for me: Only 
the first getchar() seems to wait for a character, all the subsequent ones 
don't wait anymore and just continue immediately ... is this working for 
you? Or do I need another patch on top?

  Thanks,
   Thomas



