Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36833FEFB5D
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRpOnZD+Jg6lxjd6gnRzUgU2sQ6Vx3KoehoPCipoIwY=; b=g9TqTwCKL8lx0x
	3uXW64NtMkaYrnNTZ8C7a0hq68ugQTbgeeKfvq4nCxVtWNfwVjftXPojhIvKywWRut8FqYNezc0Om
	7Azr1BIwwSXX9CGzEnsgS9osb6/Xbtg/3756+ElazaBvHLC3ubCyVQxmL9LoZsCjj/v3N4C5ckVZl
	X4lk4bNZmM942htWoM110nlkH18lsj5QQb9vbO2cBmMpWlMNKUKrOU8zBStnOCKoJZssXFPPjCg/n
	O+5eRdP6+eA8wdU00f/0QeTFzVlUk8n4JUZtXEcCE86vXmBQcvuT1ck68REt/WqiXbpkejJDABpbV
	wPvNcinQ16JTwM+86MXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzX1-00000008YqB-3FdQ;
	Fri, 27 Feb 2026 15:13:31 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzWz-00000008Ypb-118B;
	Fri, 27 Feb 2026 15:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FWU+AoGX9eH3mCsh3LQUgdVuyGEg7A83/ykl1w+gkCQ=; b=VBFZUizvgZG78Youf4F+MeuRT2
	zri9gJa8VJVZ5M6To8Tru9dkJszT42T+HnSu3Linjj54Cre1zTBIRISI2Y2bBBZzcBR/QsOFFXhxq
	ta5/gvMUNi5XaBlqWdwXys81LGEl8Oq15xR6bbzo73PtB/vmOYhPpEzvtDSHj3E/dCyCXg4Uxjop+
	EBWg04SLhWki8tp+QNbFBzkK7dcpZKPpKVvBo0Oqhd5LaipYyIaq5LE0HzdnTqy17Hd1BQ9M9+lVd
	MMJ7Y72wIevZWLffmLfqJs7PD9o/ZNjE4Ebo4POqVfrCG9pLNOS0pQGM5R8OtCzT8ulNWsHGzN35Y
	jsDMgJfQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:56296)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvzWi-006hGu-0F;
	Fri, 27 Feb 2026 16:13:12 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvzWi-000PaN-2i;
	Fri, 27 Feb 2026 16:13:12 +0100
Received: from localhost.localdomain (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Fri, 27 Feb
 2026 16:13:10 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <radim.krcmar@oss.qualcomm.com>
CC: <ajones@ventanamicro.com>, <alex@ghiti.fr>, <anup@brainfault.org>,
	<aou@eecs.berkeley.edu>, <atish.patra@linux.dev>, <daniel.weber@cispa.de>,
	<jo.vanbulck@kuleuven.be>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <lukas.gerlach@cispa.de>,
	<marton.bognar@kuleuven.be>, <michael.schwarz@cispa.de>,
	<palmer@dabbelt.com>, <pjw@kernel.org>
Subject: Re: [PATCH 4/4] KVM: riscv: Fix Spectre-v1 in PMU counter access
Date: Fri, 27 Feb 2026 16:12:47 +0100
Message-ID: <20260227151247.18602-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <DGPS39X0VRTU.3ATPEH33LUF1G@oss.qualcomm.com>
References: <DGPS39X0VRTU.3ATPEH33LUF1G@oss.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-06.um.gwdg.de (10.108.142.65) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071329_325251_B064DCD5 
X-CRM114-Status: UNSURE (   6.93  )
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

Thanks for the review!

> This one also covers a non-speculation bug, since the previous condition
> used cidx > RISCV_KVM_MAX_COUNTER. :)  I'll send a patch for that.

Nice catch, thanks for sending the fix.

> I noticed a few other places where mis-speculation is possible,
> see below; can you explain why they don't need protection?

They do, I missed those. Will send a v2 incorporating all four sites.

Thanks,
Lukas

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
