Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3C0C9831E
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 05:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyUp7O2Idr/zDMhs6Kkkxc5iIKGnS9r+9A12UH3Tdcs=; b=wzBqYAVj0Ckc+M
	HIItSmgg79SsZ4NHdE8AZWocy3Yqu+POhm6fHH9fSHf/jzpZi1lTab2gBG9BOxT9x/1PR4AdDqgBc
	+XyTCfzwNrPHBNdaWOA4ftMOlihAtculTFOjsnIH0L9lbZ80exuYv7sU+R1W9F6NrJUHVdP7whkHZ
	pEfaAd3Zr1mtfuFz/VTcRD5AsUAVAZQS2V09+wDNH04i8832Xs5NHLmHKhi7QjVaDxzuwoGXVo6En
	Ogg4Is9Yj4c2ikNBi4tr8+xiZLcINR6oKEKRfs1r14PeI+ZMF3RcK3jXk8wN+AzkgPXxWyz6d8ujd
	t98oc4bAbrN4lbkU1u8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKo4-0000000F0rq-1M5l;
	Sat, 26 Sep 2026 05:18:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKo0-0000000F0r3-2KM2
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 05:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790399913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=ZpmBgmKUzC2rwgWLp1KZsgs+sTv8qROomCw2vynZFymPNyrC45PUBLDMFP3xEIf35I2F87
	BMSjlFpHZKvL2Opxiff+O4HruWAtA8EnnRhYfdhVHSnBQs42KPhKzR2EE5RkfT+2/cAjWq
	Kzu6L+rfwAps0fKKBYY43/R1wDoDG6g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-j_rOfgzlNsqWzvsOBAFx3Q-1; Sat,
 26 Sep 2026 01:18:30 -0400
X-MC-Unique: j_rOfgzlNsqWzvsOBAFx3Q-1
X-Mimecast-MFC-AGG-ID: j_rOfgzlNsqWzvsOBAFx3Q_1790399908
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 271711955F29;
	Sat, 26 Sep 2026 05:18:27 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A9392180036E;
	Sat, 26 Sep 2026 05:18:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Atish Patra <atish.patra@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jean-Christophe Guillain <jean-christophe@guillain.net>,
	=?UTF-8?q?Pawe=C5=82=20S?= <spawel523@gmail.com>
Subject: Re: [PATCH v2 0/7] KVM: Serialize vCPU creation and revert vcpu_ids tracking
Date: Sat, 26 Sep 2026 01:18:20 -0400
Message-ID: <20260926051820.192707-1-pbonzini@redhat.com>
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
References: 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: jj9dy4llqwLuzEEAlSzoWhrPOaN6TT0aqYjDPdkBzRo_1790399908
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_221836_712064_D3E1A9B9 
X-CRM114-Status: UNSURE (   3.72  )
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

Queued, thanks.

Paolo



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
