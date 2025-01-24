Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC02C0218B
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0kQnok+du6PpPuTrrV0AYow+jQUf3rlCgIiBFXhXu6E=; b=0J4AjOkvkBZ7aN
	Lal/f6ADDEqzqewN6dsjjj5ZwfMb4lS3h+yZLhkk+wW8M9V+CsQTJGNEvd8/o/msU70ylVARk/xSl
	mZT5GuKTIUNqW2WP5Wy7X8UA+hQBupspBRIMNF7tGk5XCYG67uQC/OGvHto8h4t6Ypt/Vn4DUWoQM
	fCX4fS+16zEvYxE+q9YYGDk8JYc5z1YfY15ItdF7MW729+BxNe6WJzjOrHbNs6pjHMmBaG9UHtINo
	MFon1EL/CeF1plgniyiiJiGkpP60O4NnGBnSSik354y5jgt5x5DySM/a3b7Aam16+wp/RLXkYku5x
	CHz3XAiPZAOi3uHMrhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb75h-0000000DXqH-22PG;
	Thu, 23 Jan 2025 23:58:29 +0000
Received: from [38.43.111.254] (helo=mail.grupoarka.pe)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb75e-0000000DXpH-2eB6
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 23:58:27 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.grupoarka.pe (Postfix) with ESMTP id 5E81710A0A083
	for <kvm-riscv@lists.infradead.org>; Thu, 23 Jan 2025 18:36:59 -0500 (-05)
Received: from mail.grupoarka.pe ([127.0.0.1])
 by localhost (mail.grupoarka.pe [127.0.0.1]) (amavis, port 10032) with ESMTP
 id idarJqnwQe_3 for <kvm-riscv@lists.infradead.org>;
 Thu, 23 Jan 2025 18:36:59 -0500 (-05)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.grupoarka.pe (Postfix) with ESMTP id 5159D10A0E665
	for <kvm-riscv@lists.infradead.org>; Thu, 23 Jan 2025 18:13:23 -0500 (-05)
X-Virus-Scanned: amavis at grupoarka.pe
Received: from mail.grupoarka.pe ([127.0.0.1])
 by localhost (mail.grupoarka.pe [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Mm4t_SSR6V4z for <kvm-riscv@lists.infradead.org>;
 Thu, 23 Jan 2025 18:13:23 -0500 (-05)
Received: from gosfordukfinanceltd.com (gateway [172.27.225.126])
	by mail.grupoarka.pe (Postfix) with ESMTP id 136A010A14DB0
	for <kvm-riscv@lists.infradead.org>; Thu, 23 Jan 2025 17:57:14 -0500 (-05)
From: Mr Simon <simon@gosfordukfinanceltd.com>
To: kvm-riscv@lists.infradead.org
Subject: RE: RE: NEW BUSINESS PLAN
Date: 23 Jan 2025 23:54:27 -0800
Message-ID: <20250123235427.9C759423EDF3739A@gosfordukfinanceltd.com>
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_155826_794769_50F85298 
X-CRM114-Status: UNSURE (  -0.81  )
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
Reply-To: ritchie@gosfordukfinance.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Greetings,

The GOSFORD FINANCE & LOANS LTD (UK) invites you to partner with 
us and benefit from our new Loan and Project funding program. We
offer loans and funding for various good projects. This is 
however in the form of a partnership.

Do you have projects and businesses that require funding? We are 
ready to give out Loans (big or small), at just 2% per annum for
15 years. If you're interested in any of our proposals, then send 
me your mobile phone number so that I can write to you or give
you a call for more details on our Loan Investment Funding Plan.

I look forward to your response

Mr Simon
GOSFORD FINANCE &
LOANS LTD

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
