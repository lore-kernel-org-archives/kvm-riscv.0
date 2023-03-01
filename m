From: Björn Töpel <bjorn@kernel.org>
Date: Wed, 01 Mar 2023 17:57:27 +0100
Subject: [PATCH -next v14 09/19] riscv: Add task switch support for vector
In-Reply-To: <Y/+AN0e5netDShxx@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-10-andy.chiu@sifive.com> <Y/+AN0e5netDShxx@spud>
Message-ID: <87v8jk8l54.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Conor Dooley <conor@kernel.org> writes:

> Hey Andy,
>
> On Fri, Feb 24, 2023 at 05:01:08PM +0000, Andy Chiu wrote:
>> From: Greentime Hu <greentime.hu@sifive.com>
>> 
>> This patch adds task switch support for vector. It also supports all
>> lengths of vlen.
>> 
>> [guoren at linux.alibaba.com: First available porting to support vector
>> context switching]
>> [nick.knight at sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
>> code refine]
>> [vincent.chen at sifive.com: Fix the might_sleep issue in riscv_v_vstate_save,
>> riscv_v_vstate_restore]
>> [andrew at sifive.com: Optimize task switch codes of vector]
>> [ruinland.tsai at sifive.com: Fix the arch_release_task_struct free wrong
>> datap issue]
>> [vineetg: Fixed lkp warning with W=1 build]
>> [andy.chiu: Use inline asm for task switches]
>
> Can we *please* get rid of these silly changelogs in the commit messages?
> Either someone did something worthy of being a co-developer on the
> patch, or this belongs under the --- line.
> It's a bit ridiculous I think to have a 15 word commit message for the
> patch, but have like 8 different bits of per-version changelogs...

Yes, please! And not only for this patch, but for the series in
general. The series needs a respin for various reasons, so now would be
a good opportunity to clean up the changelog.

Simply move it to the cover letter, or below --- as Conor suggests.

