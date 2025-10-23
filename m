Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864F6CCD1BE
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MQW+6YQHlHS9Cy4xEPaJk4Upu3hZVBDm6Nu4P95C6o=; b=j49b4gIHKCw2a3XQdnVqfJ59dp
	/ZilmIHjzuA/F5/0FKIcRLoRYWa5nHSidXUeplX23g034kDmf2mqxJo+w1EcSjOZYuqYl7DvhrnT0
	aUKyCdZWEw6sQvoCdgD1rHhn2E5pUmPktohcaWrPLE8U0mdolCBg5gaiOiwfNgyMAgpBRmykQTtvU
	RGt/GyIIhYhErTkeUftKln0qM/0F1X+duVFf7cLJ04YeP5K7NKCnmqeqzjYSVI4knWDrsoAWetJl3
	YAc7n0bvp81soxkASxMUcmqxuzmYkHOcdevDDZkOLQgA8U0gK4cL3f8iaejbP1pOunhTxV5+C/APM
	0/jZuylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvhU-00000006T58-44d3;
	Thu, 23 Oct 2025 13:49:56 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvhS-00000006T4f-0Ylq;
	Thu, 23 Oct 2025 13:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n3
	8rpblOs+l0Uh+pRnN15UApR181ML0sIibuGLecbPY=; b=GAojAMkQUT29pCF11y
	uJWTUHgw+03xw3YVk+6v1tAzeXK6Ppsg0nwLfhAOkAPiJo3FoomdFKDj7+5GKuMC
	1KuaAghb3JihmLffl/0I2TRPlnoVvqKo/0GnmdRwcgJ5gBKgL8Skvl/LEiQjXImW
	YulUfd4eCY2gTXyjRnB5EUAmA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDnT0PvMfpoOIyWAQ--.32275S4;
	Thu, 23 Oct 2025 21:47:35 +0800 (CST)
From: Jinvas <jinvas@126.com>
To: jgg@nvidia.com
Cc: ajones@ventanamicro.com,
	alex.williamson@redhat.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	tjeznach@rivosinc.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC access
Date: Thu, 23 Oct 2025 21:47:08 +0800
Message-Id: <20251023134708.1192-1-jinvas@126.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20250922235651.GG1391379@nvidia.com>
References: <20250922235651.GG1391379@nvidia.com>
MIME-Version: 1.0
X-CM-TRANSID: PikvCgDnT0PvMfpoOIyWAQ--.32275S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw17Zry8JFy5Jw1xXw13Arb_yoWkJrc_Zr
	n5Ar42q34xA3Z2vrW8Grs8XrWUKa1UXr43t3y7W3yfA34jkr48JF1vg3Z0vw47Xrs7CrZI
	gFy3JFW3uw17ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Q18PUUUUU==
X-Originating-IP: [36.106.89.176]
X-CM-SenderInfo: xmlq4tbv6rjloofrz/1tbi1x7vlmj6HzMJSwABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_064954_579115_C8D9E945 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: multipart/mixed; boundary="===============1022697963056256966=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============1022697963056256966==
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Sep 2025 20:56:51 -0300, Jason Gunthorpe wrote:=0D
> We no longer need to support 32 bit builds and we missed this while=0D
> cleaning up.=0D
> Right now the only way to deal with this would be to only use one of=0D
> the S1 or S2 and make that decision when the iommu driver starts. You=0D
> can return the right SW_MSI/HW_MSI based on which PAGING domain style=0D
> the driver is going to use.=0D
=0D
> I recommend if the S2 is available you make the driver always use the=0D
> S2 for everything and ignore the S1 except for explicit two stage=0D
> translation setup by a hypervisor. Thus always return HW_MSI.=0D
> If the iommu does not support S2 then always use S1 and always return=0D
> SW_MSI.=0D
=0D
I strongly agree with this suggestion,=0D
because on one hand, the confusing design of RISC-V =E2=80=94=0D
particularly the translation rules of the msix_table =E2=80=94=0D
leads to different translation behaviors in S1 and S2 modes;=0D
=0D
on the other hand,=0D
designing a proper caching mechanism for the msix_table=0D
in both S1 and S2 modes is quite challenging.=0D
=0D
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>=0D
=0D
Thanks for the patch!=0D
=0D
Best regards,=0D
jinvas=



--===============1022697963056256966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============1022697963056256966==--
