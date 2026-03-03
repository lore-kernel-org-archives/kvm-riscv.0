Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F55EC049D
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2by3MKHGrGTUHAoPZ//A8sYZLPogBMYcQ4n7ugV+OOs=; b=3QmkPQXxK5++Mv
	IRKfbUlIHVMyYab5rBs1CXCSuyBbAo+uuac5VO4YfZ35uhtUWxwaWtvAHzkofhNbzc2UrhWhd2c2J
	C3fpOg75bWNdsnAAxdhKNsN9e8w59LwoP8wkHRX+A9wC+Od5Mb8si1tm7uiQP+XcrednxSgZ4nbXK
	Sx7i3Q6uDkLMTtfi+zXHLTCOjlxEo3kPP4JFPvfWAkTN67tzVN2AaOuOSkYPWx1QnaVT2wv5EaZXE
	3n7JP8XZ1kdYAKdlEPvvlUfyRJL+KNQYkjsWrPrtRAMIKCRSDYnBnaIfgT/O7pWea51Sh3ykFmvi5
	+Fl3IK2EDO0/sm5NxnoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMiW-0000000EwNC-0EwJ;
	Tue, 03 Mar 2026 10:11:04 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMiT-0000000EwMk-1QJ6;
	Tue, 03 Mar 2026 10:11:03 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowADHWQ2Os6Zp6paTCQ--.25899S2;
	Tue, 03 Mar 2026 18:10:23 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH] RISC-V: KVM: Change imsic->vsfile_lock from rwlock_t  to raw_spinlock_t
Date: Tue,  3 Mar 2026 10:10:22 +0000
Message-Id: <20260303101022.2174021-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy1x=4J2fZA-U_nB2yvFP38rmdcwVqYsR7c_6kHQw56+ew@mail.gmail.com>
References: <CAAhSdy1x=4J2fZA-U_nB2yvFP38rmdcwVqYsR7c_6kHQw56+ew@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADHWQ2Os6Zp6paTCQ--.25899S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8AF1rtrW7Jry3Kw15Arb_yoWDXFcEkr
	Z5KFyxJ3y5Ar1UWrs5Xw1fZF1vkanrAa4xKrWrGFySvryDGFs3GayfKrZ093ZxAw4xG3y2
	krsxJrZ3Xr9I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeApnUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBg0PCWmmd08nhAACsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_021101_780430_A835150F 
X-CRM114-Status: UNSURE (   6.39  )
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

Hi Anup,

Thank you for the review and for pointing out the issue.

I've been trying to reproduce the problem following the setup described in 
https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU.

I tested with this patch applied on two different kernel bases:
1. https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git master
2. https://github.com/kvm-riscv/linux master

I modified the QEMU command from the wiki to enable AIA:
./qemu/build/qemu-system-riscv64 -cpu rv64 -M virt,aia=aplic-imsic -m 512M \
  -nographic -kernel ./build-riscv64/arch/riscv/boot/Image \
  -initrd ./rootfs_kvm_riscv64.img \
  -append "root=/dev/ram rw console=ttyS0 earlycon=sbi"

Then ran the guest with:
./apps/lkvm-static run -m 128 -c2 --console serial \
  -p "console=ttyS0 earlycon" -k ./apps/Image --debug

In my testing, the guest boots successfully.

Could you please provide more details about your setup so I can reproduce 
the issue?

Thanks,
Jiakai


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
