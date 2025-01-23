Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A4CC02182
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Xx/Gi8RfXBqv0STggjlSTzKvGFyadYuq2YYVnMJTpU=; b=WAGH2NehejjcDO
	6BwrtjtoHw0wfk6OqKM02MB00QMZyPIyhy0yNiNpu0lAoZtC8v7B5g2FK8+pa+jbBKoW5gBYuodhf
	J+jueRckXLqnI4fe9F3IE7OjNFEtRmZXSUd6Y2SBUCT/qETfb9xRrhxiXSfifrWvmkdwynRHB2AyL
	b93qfgb+ETlBFBuKwpuqJbSRvnovppfrqqFkh2V3PMEquInAr/IEJ8+s1BxC7Hh+7XMFIcIloVrqJ
	Vv1zjqFUKihc9wSvlX4Uxq+mOoWM4iAf80+CCgMouq3hDYMMPUgyb2HiRaGmtRADiUl9IJ5GpWNtV
	Iq7j2EYmGitEJAhCbI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tay4F-0000000Cb1V-2Myl;
	Thu, 23 Jan 2025 14:20:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tay4C-0000000Cb14-0tVw
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 14:20:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3FE41063;
	Thu, 23 Jan 2025 06:20:45 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 547893F694;
	Thu, 23 Jan 2025 06:20:14 -0800 (PST)
Date: Thu, 23 Jan 2025 14:20:07 +0000
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
Subject: Re: [kvm-unit-tests PATCH v2 12/18] scripts/runtime: Add default
 arguments for kvmtool
Message-ID: <Z5JQF38bJQFeWrbJ@raptor>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-13-alexandru.elisei@arm.com>
 <20250121-16510b161f5b92ce9c5ae4e1@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121-16510b161f5b92ce9c5ae4e1@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_062020_343697_4BC0F48F 
X-CRM114-Status: GOOD (  25.60  )
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

Hi,

On Thu, Jan 23, 2025 at 03:07:18PM +0100, Andrew Jones wrote:
> On Mon, Jan 20, 2025 at 04:43:10PM +0000, Alexandru Elisei wrote:
> > kvmtool, unless told otherwise, will do its best to make sure that a kernel
> > successfully boots in a virtual machine. Among things like automatically
> > creating a rootfs, it also adds extra parameters to the kernel command
> > line. This is actively harmful to kvm-unit-tests, because some tests parse
> > the kernel command line and they will fail if they encounter the options
> > added by kvmtool.
> > 
> > Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> > line argument") addded the --nodefaults kvmtool parameter which disables
> 
> added
> 
> > all the implicit virtual machine configuration that cannot be disabled by
> > using other parameters, like modifying the kernel command line. Always use
> > --nodefaults to allow a test to run.
> > 
> > kvmtool can be too verbose when running a virtual machine, and this is
> > controlled with parameters. Add those to the default kvmtool command line
> > to reduce this verbosity to a minimum.
> > 
> > Before:
> > 
> > $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> >   Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> > Unknown subtest
> > 
> > EXIT: STATUS=127
> >   Warning: KVM compatibility warning.
> > 	virtio-9p device was not detected.
> > 	While you have requested a virtio-9p device, the guest kernel did not initialize it.
> > 	Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
> >   Warning: KVM compatibility warning.
> > 	virtio-net device was not detected.
> > 	While you have requested a virtio-net device, the guest kernel did not initialize it.
> > 	Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
> >   Info: KVM session ended normally.
> > 
> > After:
> > 
> > $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> 
> On riscv I've noticed that with --nodefaults if I don't add parameters
> with --params then kvmtool segfaults. I have to add --params "" to
> avoid it. Does that also happen on arm? Anyway, that's something we
> should fix in kvmtool rather than workaround it here.

This should fix it:

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 85c8f95604f6..f6a702533258 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -256,9 +256,10 @@ static int setup_fdt(struct kvm *kvm)
                if (kvm->cfg.kernel_cmdline)
                        _FDT(fdt_property_string(fdt, "bootargs",
                                                 kvm->cfg.kernel_cmdline));
-       } else
+       } else if (kvm->cfg.real_cmdline) {
                _FDT(fdt_property_string(fdt, "bootargs",
                                         kvm->cfg.real_cmdline));
+       }

        _FDT(fdt_property_string(fdt, "stdout-path", "serial0"));


Looking at the timestamp on the commit, the patch that added --nodefaults
came before the patch that added riscv to kvmtool (by about a month). Just
in case you want to add a Fixes tag.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
