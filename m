From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Tue, 23 May 2023 17:22:03 -0700 (PDT)
Subject: [PATCH -next v20 23/26] riscv: Enable Vector code to be built
In-Reply-To: <20230518-rented-jogging-b84c705f7d76@spud>
Message-ID: <mhng-4f11f1da-100c-452f-8717-e059d6e1d44b@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 18 May 2023 10:31:37 PDT (-0700), Conor Dooley wrote:
> On Thu, May 18, 2023 at 04:19:46PM +0000, Andy Chiu wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>> 
>> This patch adds configs for building Vector code. First it detects the
>> reqired toolchain support for building the code. Then it provides an
>> option setting whether Vector is implicitly enabled to userspace.
>> 
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
>> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>
>> Suggested-by: Conor Dooley <conor.dooley@microchip.com>>
>
> You can drop this tag if you respin, I just provided review comments ;)
> Also, it has an extra > at the end.
>
> Otherwise, I am still not sold on the "default y", but we can always
> flip it if there is in fact a regression.

It's definately the riskier of the options, but the uABI issue will only 
manifest on systems that have V hardware.  Those don't exist yet, so 
aside from folks running QEMU (who probably want V) we're only risking 
tripping up users on pre-release silicion -- and that's always a 
headache, so whatever ;)

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks.

