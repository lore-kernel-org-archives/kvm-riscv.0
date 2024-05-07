From: Jarkko Sakkinen <jarkko@kernel.org>
Date: Wed, 08 May 2024 01:36:35 +0300
Subject: [PATCH v2 3/5] selftests: Include KHDR_INCLUDES in Makefile
In-Reply-To: <20240507214254.2787305-4-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-4-edliaw@google.com>
Message-ID: <D13RSJRDTUQO.UA22FQGU3839@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed May 8, 2024 at 12:38 AM EEST, Edward Liaw wrote:
> Add KHDR_INCLUDES to CFLAGS to pull in the kselftest harness
> dependencies (-D_GNU_SOURCE).
>
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Signed-off-by: Edward Liaw <edliaw@google.com>

Oops, this is not for this patch but for SGX. Pressed D by mistake
in aerch, so for SGX one:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

