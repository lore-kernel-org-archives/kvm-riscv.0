From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 15:46:32 +0800
Subject: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
In-Reply-To: <Y9GZbVrZxEZAraVu@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
Message-ID: <CABgGipW430Cs0OgYO94RqfwrBFJOPV3HeS24Rv3nHgr4yOVaPQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 26, 2023 at 5:04 AM Conor Dooley <conor@kernel.org> wrote:
> Firstly, no-implicit-float is a CFLAG, so why add it to march?
I placed it in march because I thought we need the flag in vdso. And,
KBUILD_CFLAGS is not enough for vdso. However, I think we don't need
this flag in vdso since it is run in user space anyway.
> There is an existing patch on the list for enabling this flag, but I
> recall Palmer saying that it was not actually needed?
The flag is needed for clang builds to prevent auto-vectorization from
using V in the kernel code [1].

> Palmer, do you remember why that was?
The discussion[2] suggested that we need this flag, IIUC. But somehow
the patch did make it into the tree.
>
[1]https://lore.kernel.org/all/CAOnJCULtT-y9vo6YhW7bW9XyKRdod-hvFfr02jHVamR_LcsKdA at mail.gmail.com/
[2]https://lore.kernel.org/all/20221216185012.2342675-1-abdulras at google.com/

