Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C262C3ABBE
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dugRyeUb+hK5mfGrIrscbZXt11NhX9QNMeywQZ2WQ64=; b=p1uZ5UPjOmcwHB
	A99vszESV9qcyBc/O4wLFgsJPnArSr3Zf2WcCwOOqllhq06acRpfxyhepyH3Bgj2Z0DNWibIbUoTJ
	Fiko3D1CFenMI0QEPtS9ehWqjhdGczbew5Zfmf/Xeh4fw/Uui9k/Zo0VWYsJ8ymFCASZApFLhfp/H
	SvWhkKshcE8WWbwWrlXOi9Q83+uD8qPpdzqE5Yi0IMgsm07urEW7ZiHOMgXQWb92ev6bxk9XRN3wT
	g8dusoPI4nA2/dy/3L+JdcTqCD69a5an0eTNoD3W3pBXApf7Chw//LeBdm+eXttQnI981ymxpDO3W
	6E+XLVmyPxx7LOLDQjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxxL-00000000Jaf-2Ea0;
	Thu, 08 May 2025 09:54:19 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxjZ-00000000HVZ-0Vxq
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 09:40:07 +0000
Date: Thu, 8 May 2025 11:39:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746697201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rd4X9VJub0p8Z48NlXuvNR1+VIxbKa4gUctZklcxAAU=;
	b=jLBeEIJeOs0a7cKKkC/3kmj0tYlNG1kh/EykuU2zvp/el6AjEn9I0nJ/oYuSPya996hXJ7
	0BY3GuiOuGEJdPcMm0C6wo/G5NP9fGfOXApSp8xqVFUfH48j1Gp3KfpXnJYN4kMETZhjR9
	YW9/YoXzBRvzfQWGf1w/pvq9/l2FV80=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <20250508-0227212b80950becb999ad30@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
 <20250507-78bbc45f50ea8867b4fa7e74@orel>
 <aBxw1uaO1FZQ15VR@raptor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aBxw1uaO1FZQ15VR@raptor>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_024006_124526_2B873259 
X-CRM114-Status: GOOD (  22.19  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 08, 2025 at 09:52:38AM +0100, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Wed, May 07, 2025 at 06:02:31PM +0200, Andrew Jones wrote:
> > On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> > > Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> > > architectures can only set --target to 'qemu', which is also the default.
> > > 
> > > Needed to make the changes necessary to add support for kvmtool to the test
> > > runner.
> > > 
> > > kvmtool also supports running the riscv tests, so it's not outside of the
> > > realm of the possibily for the riscv tests to get support for kvmtool.
> > > 
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > ---
> > >  configure | 36 ++++++++++++++++++++++++------------
> > >  1 file changed, 24 insertions(+), 12 deletions(-)
> > >
> > 
> > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> 
> Thank you for the review!
> 
> Just to be clear, you are ok with this happening because of the patch:
> 
> $ git pull
> $ make clean && make
> $ ./run_tests.sh
> scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 2 #  /tmp/tmp.bME9I2BZRG
> qemu-system-x86_64: 2: Could not open '2': No such file or directory
> scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> FAIL apic-split
> scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 1 #  /tmp/tmp.11und6qZbL
> qemu-system-x86_64: 1: Could not open '1': No such file or directory
> scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> FAIL ioapic-split
> [..]
> 
> That's because TARGET is missing from config.mak. If you're ok with the
> error, I'll make it clear in the commit message why this is happening.
>

It's not ideal, but I think it's pretty common to run configure before
make after an update to the git repo, so it's not horrible. However,
as you pointed out in your cover letter, this can be mitigated if we
use function wrappers for the associative array accesses, allowing
$TARGET to be checked before it's used. I'd prefer the function wrappers
anyway for readability reasons, so let's do that.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
