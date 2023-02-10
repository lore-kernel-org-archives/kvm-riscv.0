From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 Feb 2023 20:00:00 +0800
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <36A0C855-5EA7-49B5-B92E-B28E684AC3D8@kernel.org>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com>
 <Y9MIr2iR5rzlIGKQ@spud> <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
 <36A0C855-5EA7-49B5-B92E-B28E684AC3D8@kernel.org>
Message-ID: <CABgGipXMwnVPFY3D34zVQ1_MObYiYze-vvU23_yC12Q+xN+1ew@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 6, 2023 at 9:40 PM Conor Dooley <conor@kernel.org> wrote:
> I suppose my question was "is it safe to warn and carry on, rather than disallow use of vector in this situation".
Yes, I think it is safe to warn and carry on. This is a check for
memory leak if future code did not allocate/free datap correctly.

Thanks,
Andy

