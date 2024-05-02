From: Thomas Huth <thuth@redhat.com>
Date: Thu, 2 May 2024 10:23:22 +0200
Subject: [kvm-unit-tests PATCH v3 0/5] add shellcheck support
In-Reply-To: <20240501112938.931452-1-npiggin@gmail.com>
References: <20240501112938.931452-1-npiggin@gmail.com>
Message-ID: <2be99a78-878c-4819-8c42-1b795019af2f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 01/05/2024 13.29, Nicholas Piggin wrote:
> This is based on upstream directly now, not ahead of the powerpc
> series.

Thanks! ... maybe you could also rebase the powerpc series on this now? (I 
haven't forgotten about it, just did not find enough spare time for more 
reviewing yet)

> Since v2:
> - Rebased to upstream with some patches merged.
> - Just a few comment typos and small issues (e.g., quoting
>    `make shellcheck` in docs) that people picked up from the
>    last round.

When I now run "make shellcheck", I'm still getting an error:

In config.mak line 16:
AR=ar
^-- SC2209 (warning): Use var=$(command) to assign output (or quote to 
assign string).

Not sure why it's complaining about "ar" but not about the other lines in there?

Also, it only seems to work for in-tree builds. If I run it from an 
out-of-tree build directory, I get:

*/efi/run: */efi/run: openBinaryFile: does not exist (No such file or directory)

  Thomas


