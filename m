Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC87CA5FBA
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkFW2rWBUXVsfJ82Q26N3eDKrG3mMh/HTrAwPgGBTAk=; b=OIVb5ss+wDgEkP
	bzTpxB5cm2b0gHHO2XtzmL2P9WCZYDpTmCNI+tSFj8c0Re3bkUdkU4DuwKHFsMx8NCW/VAE/uu2Vx
	5C91nKdAkS4kCWFMBR9eniffhSgF6M3irlWin6HtoOzVK+pkGJ03QEi/zOT3iLaTMlHMIOUaMoVfb
	kCnxvgRsCOigfs9Fd0qMvGZFs0juSjp0w2AVr5eay3UbscfSL8oUX+KbnTZh9uWYph8K7haSiVQcq
	tcgJQo1RRHDhl0iFd2+4kBgEo5o8ehoWbAwobLeFu2vfsa/2KT4T2Cjl6s5MWTDv+xHNMG/ZSXj2R
	jyy+239qR99Xrgr3wO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrXb-00000005lAI-3EwG;
	Wed, 30 Sep 2026 10:27:59 +0000
Received: from out-25.mta1.migadu.com ([95.215.58.25] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrXY-00000005l91-0pXU
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 10:27:57 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/J7FDCknwMONLwnuF/qlU07GuECyKi8lksm5VPBahVQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790764074; v=1; x=1791368874;
 b=n6n8Ea+WEkd9FUW7TAjttwXKqCu0u4/TCmcs4kkuDnRc9+metHFRh5qvidhEeDLVGMILUnsQ
 M1JuzHalQiT372IDSdqhSEK4DYrSGIbW1DJzHbgceQSD2VR8RHP92mTnsZVmOPw76oV3ovkRskj
 I/ldkmQQqczvEFFQnRJAyBAM=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0e9b1d8d130e3b7b;
	Wed, 30 Sep 2026 10:27:54 +0000
X-Mizu-Trace-ID: 0e9b1d8d130e3b7b
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 12:27:53 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 6/7] riscv: efi: Allow ACPI boots
Message-ID: <wpaf7nksxsprt76pibwgq7a5zrjudhqfthv4jckvdqgai7nvss@7mq3o3jjlew7>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-7-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-7-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_032756_387025_768439DF 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 24, 2026 at 11:39:44AM +0800, Xiang W wrote:
> riscv/efi/run rejected EFI_USE_ACPI=y because CPU, timer and ISA
> discovery aborted without a DT. Those paths can now walk MADT and
> RHCT, so drop the early exit.
> 
> The existing runner already omits -machine acpi=off when
> EFI_USE_ACPI=y. QEMU virt defaults to ACPI enabled, so no extra

EFI_USE_ACPI != y

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
