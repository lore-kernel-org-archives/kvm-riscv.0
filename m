Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBBECCF2E5
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WEwUpFg8gD94TbjrdiA+8s2qJ6XSHk1JAhkUO8cedA=; b=RHFNjpIo050prX
	TiLrZvq0NIkWZtaWdKkQ2IAezFSSgHimnHhFAMn3L//4G2ZBvqSDei79tVbXKyQ1MjoAXF50Y8nN9
	Fx9AeDtB4uZ7knomeJWmjrRFtkVxpHQ988P2GzNxNV7f+DF7Ou+kPDAkhd12rKUH0XbP8iAMEIpGj
	CqB3QYuHIlXcN4zdoFsYrLkoOvQ1tQvm+EUiGmsEwklRzj+SDqpoWMUhWDty598LiVLLyyF28mBes
	GdPYMgpi1O2UuYmS5ZRC3U1pI9oxMAvuyl5FQk0BXSqyEx+V2kYZhtTjH7HxdTWVbYfXLSNbHpX9k
	jeFbIMMwKhfxIjaACVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInXO-00000007WqP-088f;
	Mon, 19 Oct 2026 13:36:26 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInXJ-00000007Wnw-3P8k;
	Mon, 19 Oct 2026 13:36:24 +0000
Received: from k3-03 (unknown [159.226.43.8])
	by APP-01 (Coremail) with SMTP id qwCowACHW++pHNZqOSE+Cw--.8031S2;
	Mon, 19 Oct 2026 21:35:46 +0800 (CST)
From: Tan Chi <tanchi25@mails.ucas.ac.cn>
To: fangyu.yu@linux.alibaba.com
Cc: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	gsh517025@gmail.com,
	joerg.roedel@amd.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v4 10/10] iommu/riscv: Add IOTINVAL.GVMA after updating DDT/PDT entries
Date: Mon, 19 Oct 2026 21:35:36 +0800
Message-ID: <20261019133536.1610-1-tanchi25@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917025446.4070-1-fangyu.yu@linux.alibaba.com>
References: <20260917025446.4070-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHW++pHNZqOSE+Cw--.8031S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOj7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW5GwCF04k20x
	vY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07j2E__UUUUU=
X-Originating-IP: [159.226.43.8]
X-CM-SenderInfo: pwdquxrlsvqzpdlo2hpxfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_063622_212846_34819FA8 
X-CRM114-Status: UNSURE (   4.61  )
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

Hi Fangyu,

I wonder if riscv_iommu_iodir_set_mode() also needs a global
IOTINVAL.GVMA now that second-stage translations are supported.

It currently issues IODIR.INVAL_DDT and IOTINVAL.VMA after updating
DDTP, but cached G-stage translations may still remain, for example
when the IOMMU is reinitialized after a previous kernel used
second-stage domains.

Would a global IOTINVAL.GVMA (GV=0) be needed here as well?

Thanks,
Tan Chi


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
