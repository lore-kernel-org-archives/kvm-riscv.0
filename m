Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74273C3ABBE
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKREksR4fKtYHHaukG9KEDEM5NpOsO3YPIMM6/qgqhs=; b=moZ3e1cCzIuIbJ
	kntNIAiYNipGywujccKjduiDpJQnrH3DTeS2z7XYSAhdxzP9ej1n7F7zSQf5vCRNUcFm9921+BbjR
	Z215YiWIPL0rKctQ/82sTGqmSYJEpoZJI+JG9wA4RYrftFuyERFFef0B14a5sUKLxhb8Dw+ooLmxX
	5iiIPpOzil+7kGZAFjKtZPpW1C6vsYxBlfENCjogSyfMNNqWKb+EIoP1CThynUzCsg40sr0b2icqM
	lLYNKHULYwQ7ZaSBzRE0Hsx7j5UUT0nffePcOjXwM5aALAa3NL8+beoLO4XO/aRVbKVgGG1ddoCPE
	VmtQh9nnHm4ctylRaP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy8r-00000000KuV-0qdu;
	Thu, 08 May 2025 10:06:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy8J-00000000Kq0-02TN
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 10:05:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C206106F;
	Thu,  8 May 2025 03:05:27 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5EA23F5A1;
	Thu,  8 May 2025 03:05:34 -0700 (PDT)
Date: Thu, 8 May 2025 11:05:32 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <aByB7IphzIq61BMN@raptor>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
 <20250507-78bbc45f50ea8867b4fa7e74@orel>
 <aBxw1uaO1FZQ15VR@raptor>
 <20250508-0227212b80950becb999ad30@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508-0227212b80950becb999ad30@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_030539_128856_546FC5CA 
X-CRM114-Status: GOOD (  28.23  )
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

Hi Drew,

On Thu, May 08, 2025 at 11:39:54AM +0200, Andrew Jones wrote:
> On Thu, May 08, 2025 at 09:52:38AM +0100, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Wed, May 07, 2025 at 06:02:31PM +0200, Andrew Jones wrote:
> > > On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> > > > Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> > > > architectures can only set --target to 'qemu', which is also the default.
> > > > 
> > > > Needed to make the changes necessary to add support for kvmtool to the test
> > > > runner.
> > > > 
> > > > kvmtool also supports running the riscv tests, so it's not outside of the
> > > > realm of the possibily for the riscv tests to get support for kvmtool.
> > > > 
> > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > ---
> > > >  configure | 36 ++++++++++++++++++++++++------------
> > > >  1 file changed, 24 insertions(+), 12 deletions(-)
> > > >
> > > 
> > > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > 
> > Thank you for the review!
> > 
> > Just to be clear, you are ok with this happening because of the patch:
> > 
> > $ git pull
> > $ make clean && make
> > $ ./run_tests.sh
> > scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> > timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 2 #  /tmp/tmp.bME9I2BZRG
> > qemu-system-x86_64: 2: Could not open '2': No such file or directory
> > scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> > FAIL apic-split
> > scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> > timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 1 #  /tmp/tmp.11und6qZbL
> > qemu-system-x86_64: 1: Could not open '1': No such file or directory
> > scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> > FAIL ioapic-split
> > [..]
> > 
> > That's because TARGET is missing from config.mak. If you're ok with the
> > error, I'll make it clear in the commit message why this is happening.
> >
> 
> It's not ideal, but I think it's pretty common to run configure before
> make after an update to the git repo, so it's not horrible. However,
> as you pointed out in your cover letter, this can be mitigated if we
> use function wrappers for the associative array accesses, allowing
> $TARGET to be checked before it's used. I'd prefer the function wrappers
> anyway for readability reasons, so let's do that.

I'm all for the function wrappers, I was planning to reply to that comment
later.

As to this patch, is this what you're thinking:

function vmm_optname_nr_cpus()
{
	if [ -z $TARGET ]; then
		echo vmm_opts[qemu:nr_cpus]
	else
		echo vmm_opts[$TARGET:nr_cpus]
	fi
}

But checking if $TARGET is defined makes this patch useless, and I would
rather drop it if that's the case.

Thanks,
Alex

> 
> Thanks,
> drew
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
