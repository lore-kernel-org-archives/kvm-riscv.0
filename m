From: Eric Biggers <ebiggers@kernel.org>
Date: Sun, 21 Jan 2024 10:10:09 -0800
Subject: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
In-Reply-To: <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
References: <20240121011341.GA97368@sol.localdomain>
 <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
 <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
Message-ID: <20240121181009.GA1469@sol.localdomain>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 21, 2024 at 10:32:59PM +0800, Andy Chiu wrote:
> 
> Maybe what we really should do is to upgrade the condition check to a
> one liner shell script and grep if "Warning" is being printed. Sadly
> this warning is not failing the compilation with -Werror.
> 
> I can try forming a patch on this if it feels alright to people.

What about -Wa,--fatal-warnings ?

- Eric

