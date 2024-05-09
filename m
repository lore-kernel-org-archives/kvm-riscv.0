From: Mark Brown <broonie@kernel.org>
Date: Thu, 9 May 2024 07:14:58 +0200
Subject: [PATCH v2 3/5] selftests: Include KHDR_INCLUDES in Makefile
In-Reply-To: <20240507214254.2787305-4-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-4-edliaw@google.com>
Message-ID: <Zjxb0k--qUyZKSg6@finisterre.sirena.org.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 07, 2024 at 09:38:28PM +0000, Edward Liaw wrote:

>  tools/testing/selftests/arm64/signal/Makefile          | 2 +-

This is not really using any of the kselftest framework at all to build
so I'm not sure the change makes sense for it.  OTOH it does no harm...
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240509/8584a92d/attachment.sig>
