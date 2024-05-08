From: Mark Brown <broonie@kernel.org>
Date: Wed, 8 May 2024 21:05:55 +0900
Subject: [PATCH v2 1/5] selftests: Compile kselftest headers with
 -D_GNU_SOURCE
In-Reply-To: <20240507214254.2787305-2-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-2-edliaw@google.com>
Message-ID: <Zjtqo6EFyGmSeREQ@finisterre.sirena.org.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 07, 2024 at 09:38:26PM +0000, Edward Liaw wrote:
> Add the -D_GNU_SOURCE flag to KHDR_INCLUDES so that it is defined in a
> central location.
> 
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.

Reviewed-by: Mark Brown <broonie@kernel.org>

This does mean we define _GNU_SOURCE for nolibc (and I guess any other
libc people use like bionic) but hopefully nobody's using the same
define with a different meaning so should be fine.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240508/1fcf014f/attachment.sig>
