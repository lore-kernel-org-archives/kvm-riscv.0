Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C8FC531D0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbSN8KsnDn/GZ54otTsoWKKvGGtY7qGlw2K/bE3EI5c=; b=FUcJ+KU/1ku0Sm
	UvAloM1STzDMZCsd84B2ln92T4/wNpN8FSG9KZ6v2vmwsasZ21xv705TWZf4KDXnAwOFr0gvXWPaE
	6J5xTbIPjR/pVPlmbBCy/ipPnLfnAlTDS7zYifvZtQsFS3w/vCgWFteePh25FSg7cSMb0g9tQH6qb
	28kSvgQNCVaTr24Jbu/HUJqrP0+GhmFXtqbNgZJWks3U7xcVXNTHhpqeyj8QiaS+WkhDYDBy2Gup2
	aXkGVUCd1Eib4tfqlwV5Y+dPcFHgpgWCMGlQuGiYzl//a/K7i2a3CJ3925R2hsDi7AzjKtI79QOVw
	f+KpluzsQWnB+4OBnD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKS1-00000009dXk-31zI;
	Thu, 30 Jul 2026 06:41:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKRy-00000009dWx-468b
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:41:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-472326ca506so1227611f8f.2
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785393661; cv=none;
        d=google.com; s=arc-20260327;
        b=KFtOWbOgVJbphCf0cPyzmjA/qu4DI7jb7lC/dsls/1gUv/z/ol0A+0qJfn+FZye8yl
         dmTowxpCq/bscAmp8pIWbZlSC96XzR/LmK+HLmqO7G1A1X0k9pT1uVfvusgKRqR/3bvI
         QARUaU1+e7DoZtstgjtp4Ka0vcIaeJK5q6gAgbRyaCn4KAwHBfYt/KS/HTPJt5wropQE
         WlapiwUVPUnKSvwjdFtP0gCCfIsyQCTDZqzxg4/toFDKyUH6vlNhdnBZFsiWezoDdjqo
         jINAnoqDtqknl/SN1vSRRNiq+HivudKppJx6QqDp8dfhPvZJKghhf0E6waFxyaVDN5Kc
         c15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gCSg4A13UG+ezvuOT5T/4OdsBnQnd/Owb7FoNwTVWMw=;
        fh=fK+CNAKbRNQc2TX2hXD6CGfkDm1raU/zZ7cjuPxqZcY=;
        b=TeuT9h/oew6jUBymPN+N+RtPT3+dJW1e9HbDuuqqMX7DpdIk6gLUZdyEgiBj0ccKCK
         qqLYA2jgdofEo/jGfBafVS07I/t+o6JWYQNYT09uNbFpfA1GZ5zuWQXFjEAFUY7ROP0X
         9O0AcYdWhyvnLNryRZP76Z1hGYjM29HQDdO/sN7R2w8wKPgtrxEOiTe1tP1sZnKfCagk
         zkkmxfY9yzNXlKzcXplxJT/IWFYIdQNWmijgkwxSwFm83P+nh/ggbsDBOH2Dk2LGUuNz
         INUId8H/s/IKLJn/KrVQXyEHIFxAaiJ6jRsasYdDY2OAAZUZ1vMoyRC3UgE2F2LrnBfw
         f/Iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785393661; x=1785998461; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gCSg4A13UG+ezvuOT5T/4OdsBnQnd/Owb7FoNwTVWMw=;
        b=FOn184AM6IpdtdKTRP4O+BPnOThhC9zx3YXyXWDdZxZhVMXaeyXwAJgmA/UUKkkKNp
         eY4QGzx8suhwOnJ1SRzA3DYMzETs7B1yBuwjitRZEc+fEZDHm+o1ywJ1slv++oZNi2qx
         RnTe+f0/JIPZvkF0Ab39Va0DFdNFG3Z9coCTOsY/v6UyDBVq/N8ETmDfZUcsUE5DRE3Q
         +zXdkG1u7aB0V+4uODIelXoDtb6qdPEDPtkxMJjl1+Afyq6QYtQGC+mVgkPA/ez6gLkT
         u4rkztkoKmzLyrpCTtWcwtmhpXDD/yR4E9jdS/6Lrzsocke4vJa/sib3Cf5RT2qONEIi
         HypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393661; x=1785998461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCSg4A13UG+ezvuOT5T/4OdsBnQnd/Owb7FoNwTVWMw=;
        b=KhfoI0fMal8zNEbcdG/aEVq/VheyiCHkO8myj9wNLEeqpLYQnucve2nT/2Vfbke/5h
         /6eOMgmzKCMMuzrNPDQnFEeG1b9UsaF1Fpqh5rhht5fWNIJxUd6SoARAQeM9DsueGHhJ
         eQFibe2aj94rr+9n5Ex5f2rLJnQoGKapl1WkIdwBQB2CMQtGNw/4CnQSTG0gQ1siAFfe
         T/h8y64YD7fRtZdBUsTtccdP9RB62SLqqJ7G2xvH5nQtzI9T809PZmwz0CxOauNzQVSR
         kUNilyEDIrfE0m0z1SUc7tDsopVC57kGp1AmnGOCax2pyw4mtyuyA8nQfloQ70QNF/45
         mXtg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc0fAwUDRe4zaJFEFedx9JkU8hGNjHe+C/YyW7uhPWVleZvYOAzFxdyDf9bunZ1wtq4AP4Cosudoo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJipxYxKf8RcaQIjWiZdnS50uIR6h/vz8uLQFunpE80aDXFvmk
	oWKQbRpzWRIANF8nnzCsA5G8Mz4o9aESE1052wjQ4vMAVOQkkZy/uR0TQIJaf3KsLr2Lhqfr6kT
	UzDAPRJpqUPDnPbJKJh5vsgU1kchmxKIMyFjL+N1A5g==
X-Gm-Gg: AR+sD10wgylukDk/jbJKCv7iMwI9+lX9zkaNe963wpjXWrYyqKm+J3WNqSgCa4yBO6o
	TPvR0xqaMqUIBPVKdFKs+XRF4aTJ1OLtTsHCKPx81LQ3UBXrBkPNSMrps5QdDrPQ0YOYtzBH2u6
	34Gnzjd7H9snNsseIlcElLAdvwHiF8f3CIQtv1OLJH29JgrRAa5sYGcx3Z+9VOxYPNoUz4cbLbl
	4RhstpqIuQjmvveNEHDkNsmOJTqgde80mY2jBti9XIbIogqbiTwq9BrXGERfLhwfwXAHnQIylQN
	6P8pjrLvzNeqmqP6gcBYkMXlNdZkGgg928hIUJVMtMWbZ7xZdIP3lOpfiThimSE43A0XI+qpsyn
	iZdn+K96F1aM2TNlY7/l1BFuHEHg7hv764NN6P3/5/SnvFTOxH8He1svnsCekshc=
X-Received: by 2002:a5d:64e4:0:b0:47f:81fe:12fb with SMTP id
 ffacd0b85a97d-47fc82029fbmr1441430f8f.47.1785393660872; Wed, 29 Jul 2026
 23:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260729232527.139183-1-inochiama@gmail.com>
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jul 2026 12:10:49 +0530
X-Gm-Features: AUfX_mx-1OMiSrp_cztB7RBUzQgECxkWV-SuPzBeqXIqONCE7eUdTY36tN80PSc
Message-ID: <CAAhSdy3W5LQ_iKLgb6qLNSswgh1OOjgjyAizHZ751=yq7UQTkQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] RISC-V: KVM: Cleanup SBI extension status when disable
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_234103_034239_95244D60 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgNDo1NeKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gS1ZNIFNCSSBGV0ZUIGV4dGVuc2lvbiBoYXMgbXVsdGlw
bGUgaW50ZXJuYWwgc3RhdGUgY2FuIGJlIHByb2dyYW1tZWQKPiBieSB0aGUgdXNlcnNwYWNlLiBI
b3dldmVyLCB3aGVuIHRoZSBGV0ZUIGZlYXR1cmUgb3IgdGhlIEZXRlQgZXh0ZW5zaW9uCj4gaXMg
ZGlzYWJsZWQsIHRoZSBpbnRlcm5hbCBzdGF0ZSB3aWxsIGJlIGtlcHQgYXMgaXQgaXMsIHdoaWNo
IG1heSBjYXVzZQo+IHNvbWUgc2lkZSBlZmZlY3QgZm9yIHRoZSB2Q1BVLCBjbGVhbnVwIHRoZXNl
IHN0YXRlIHdoZW4gYSBTQkkgZXh0ZW5zaW9uCj4gb3IgRldGVCBmZWF0dXJlIGlzIGRpc2FibGVk
Lgo+Cj4gQ2hhbmdlIGZyb20gdjI6Cj4gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAy
NjA3MDYwMjExNTQuMjEwMjg5LTEtaW5vY2hpYW1hQGdtYWlsLmNvbQo+IHBhdGNoIDEsIDI6Cj4g
MS4gQXBwbHkgQW51cCdzIHRhZy4KPiBwYXRjaCAzOgo+IDEuIFJlbW92ZSB0aGUgY3NyX2RpcnR5
IHNldC4KPiBwYXRjaCA0Ogo+IDEuIEFkZCBhIG5ldyBwYXRjaCB0aGF0IHNldHMgdGhlIGNzcl9k
aXJ0eSBmb3IgRldGVCBleHRlbnNpb24uCj4KPiBDaGFuZ2UgZnJvbSB2MToKPiAtIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2t2bS8yMDI2MDcwMTA5NDczMS4xMDIyMTYzLTEtaW5vY2hpYW1hQGdt
YWlsLmNvbQo+IHBhdGNoIDI6Cj4gMS4gQ2hlY2sgc3VwcG9ydCBjYWxsYmFjayBleGlzdGVkIGJl
Zm9yZSB1c2luZyBpdC4KPgo+IElub2NoaSBBbWFvdG8gKDQpOgo+ICAgUklTQy1WOiBLVk06IEFk
ZCBTQkkgZXh0ZW5zaW9uIHZhbGlkYXRlIGNhbGxiYWNrCj4gICBSSVNDLVY6IEtWTTogQWRkIFNC
SSBGV0ZUIHZhbGlkYXRpb24gc3VwcG9ydAo+ICAgUklTQy1WOiBLVk06IFJlc2V0IHRoZSBTQkkg
ZXh0ZW5zaW9uIHdoZW4gZGlzYWJsZSBpdAo+ICAgUklTQy1WOiBLVk06IE1hcmsgdGhlIHJlc2V0
IGNhbGxiYWNrIG9mIEZXRlQgZXh0ZW5zaW9uIGFsd2F5cyBkaXJ0aWVzCj4gICAgIENTUgo+Cj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgNCArKysrCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfY29uZmlnLmMgICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICAgICAgfCAyNyArKysrKysrKysr
KysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4KPiAt
LQo+IDIuNTUuMAo+CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTcuMwoKVGhhbmtzLApB
bnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
