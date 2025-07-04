Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3108BC8303D
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7TaDeofQfJtkycUiTYeanS79CHqhLSpEfOKN2/bHCc=; b=ZEPQTWKFuC+b/H
	zJQziH2ZxWijMMMAsWv66Z+TgZBR7za6FGHrz6jaJm1/BxgbYgkGkpfzK4xkhyTJ/8KNPZOVn7nVq
	ngoJOXXXQJeBtO3GRk9Y7ugeW1xE/CKvr4iHmbeadkZH3cWT4XflUJEM50aXAtG0Q7zux3i89EoAq
	AZbNyXJwF5a/xTX1txIou56ckxKEkIwgMGbiZZSZxnlA15a4NoXYjn7NZJ2/LF9mTEGJKJwewe+cW
	gWijWQvm+J/rqO0DAVCk9HJAzAznbCvBwtWE6++1RPNt6DR6h0rvjVMp+A7TB+fbewM116yqjUpem
	jUzuHn/tk2a0Dp4PWSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUJ-0000000ECGn-3EN4;
	Fri, 04 Jul 2025 11:21:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc02-0000000Dm5F-1T7N
	for kvm-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 08:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3PnaSGtLpzW5dir2K2BrEyMD5UpUXb/WyC+H8PujG7Q=; b=j/RcBM7Q+mgzNAg/Na2LqDW+iQ
	n/jVRCyq4rZxbddQpCFI4x2RCpCNYfJnGi75J4PkbTJdkb/DWGx0jNfkisxsidRyIMvDpqC7nDszX
	xqyrr1XqyeTsoawk5YctyDNyoFUOooTybG4Tp9Uh6nC8FLX5GZmulv6NMW6iqJNEt1ypShQPeVWMi
	Se8lKLLBnbu3Qljv000fVlrKFirV9OF3PE5fSAdWIlsMJiNgEJ04lmZiJNZuduiVXsvqNyEsmlZHe
	4HVB+bDXqcOJTaM2hSc6yza+6rlp/4RX5OnjkabaKUnA5KoBgwKKIvv82xryHL8uD45kr7sNQldix
	JIXRuWmA==;
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbzx-00000007ruZ-2Hxi
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:42:25 +0000
Date: Fri, 4 Jul 2025 10:41:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751618521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3PnaSGtLpzW5dir2K2BrEyMD5UpUXb/WyC+H8PujG7Q=;
	b=urgOd1aZHEwU+HOxLQWi5GvXP2k5P56SbDD8NDOc49RcISR8mr1EFZbcesPVRdbN1m7oAh
	kUPg88LuxHtjy2dAyNloPJXePywzyt89TRKSuW8cK4SqhYp1NAMI2dsOwHn9bbuihdkScS
	hMJrMblwswPleTxW+/PJzf6Xl6mDONM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <20250704-ca0e2f54c803b35428c13e0d@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_094222_587396_82EBDA9A 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> v3 can be found here [1]. Based on top of the series that add qemu_params and
> test_args [2].
> 
> To goal is to allow the user to do:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ ./run_tests.sh
> 
> to run all the tests automatically with kvmtool.
> 
> Reasons to use kvmtool:
> 
> * kvmtool is smaller and a lot easier to modify compared to qemu, which
> means developers may prefer it when adding or prototyping new features to
> KVM, and being able to run all the tests reliably and automatically is very
> useful.
> 
> * kvmtool is faster to run the tests (a couple of times faster on
> my rockpro64), making for a quick turnaround. But do keep in mind that not
> all tests work on kvmtool because of missing features compared to qemu.
> 
> * kvmtool does things differently than qemu: different memory layout,
> different uart, PMU emulation is disabled by default, etc. This makes it a
> good testing vehicule for kvm-unit-tests itself.
>

Merged. Thanks

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
