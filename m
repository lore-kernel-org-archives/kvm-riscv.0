Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25231E67A6B
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hjqp7y0KDBXQrAnL9rsmo7fH8hh3IjuX2cFELeZxDyY=; b=ydyQ4fFiushcrD
	A4nTG2CYfSQAd5QdoZMLoWszQNX8uwrB5Tz9QNEY/btyz8PL88sI6ZL2V4g8g3uHU8L4fKMiAMKk0
	bQSvwXq8k5n7wtXXxyTtI1zFUpEHH5VFxzR/87hLwzXtAjP3bGfy5TaWh2Wd+UN4t+8l7cb1Rjr3/
	m/RTeys0nlzkVwccrPP1TwvlBfaVNMOyU0QxxwTwQHBjgg/uqrzZcmtvxqWfR/C2nce/29pLkONuq
	ymYGlcT3gH9bvVpj0xGoGGTwWgZESnrNcQcHBPLnyJfv7awD+RdCt4JoCQVs32WGng7OLh+4rYWrc
	0hRqh+Fp3Fbm80wm5vPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIk0-0000000EZhu-2otG;
	Tue, 03 Mar 2026 05:56:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIjx-0000000EZhE-3a4G;
	Tue, 03 Mar 2026 05:56:19 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowACXsNf+d6ZpAcW+CQ--.5526S2;
	Tue, 03 Mar 2026 13:56:15 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: ryan.jk.hong@gmail.com
Cc: kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	xujiakai2025@iscas.ac.cn
Subject: Re:[PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
Date: Tue,  3 Mar 2026 05:56:14 +0000
Message-Id: <20260303055614.1948314-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303044432.699084-1-ryan.jk.hong@gmail.com>
References: <20260303044432.699084-1-ryan.jk.hong@gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXsNf+d6ZpAcW+CQ--.5526S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYJ7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
	CY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq
	67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4c8EcI0Ec7
	CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8a0mDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAUPCWmmMfYKtAACs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_215618_256742_2B2BCF57 
X-CRM114-Status: UNSURE (   5.25  )
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

Hi Ryan,

Thank you for pointing this out.

I did notice that the IMSIC branch follows a similar pattern. However, 
I am planning to address the KVM_DEV_RISCV_AIA_GRP_IMSIC case in a 
separate commit to keep this fix focused strictly on the reported APLIC 
use-after-free issue.

I will send a follow-up patch to add the corresponding locking for the 
IMSIC branch.

Thanks again for the careful review.

Best regards,
Jiakai


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
