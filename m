Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B10E63CA1
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpTlLQb1lwqmhpLdH46SwJjb5lNWgrqcdmk7AbzkxOg=; b=LdeSO0a2EMsNAD
	4kkDFYmHnG2gGSnv+33EWAPBSe8YIb0997UMduqXjjzrD9qUACYOG5NttlzaoAIGDK5TtJB/wdAVL
	efymMM5fJTd2mXTM0kGgkTpYShFTRyGxRPCbP0x1SjuIEwylJXww2TL77tylRWrIgQ9cYZvQHPA1t
	X9OFc/3q6y1lGr+v6/EgMgdKKLX1lBmOlqEQpyo/qzjtYG03Ilgu0JV2uguWFZgy3674UBt2vLGT3
	5rbi/EYITVddXPZoemXw4Csmzzw6tmoKPX0GFMUoGz8VdjdtCj/t4TLOQT0Bw11O37A7VWx/pU9i5
	YJG30CzaQjZwXburMgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyZw-0000000B8Ug-2R9g;
	Sun, 25 Jan 2026 11:46:52 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyZu-0000000B8Tz-1cPj
	for kvm-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 11:46:51 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-66105b0b931so1512549eaf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Jan 2026 03:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769341609; cv=none;
        d=google.com; s=arc-20240605;
        b=jLyvXRunlmCiU5wYoPjAuWj2cVwuoLznuPp+wKr04gn2P7m03oa2s74JmT5vfRCORw
         S+7Qgi5rdzOS1zSA8Ne11yWUsIjPkdVsRqS4dp7wMfuhsLw8gHOrdA9I0RPborAlTYJm
         aoIVv+AKG9udl+7TYF1AYvoQUQb+7lrzHLHCgXzUUxCfMlSG7IqKBez5xvtGOBoenufv
         o3AKrGi7fwsz+ojkyNLy7tkgqfzC4zMCPqa01OGTqnC9VgSXsvE8OpmE6UYlIbF449my
         poig46buCgi9b6gqpWQsQ3QgxvI2HS1lPzgdpNQITdrC9vfWka8jcB8uqzu4lHgW5ZjQ
         Xw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i684QgbRLKrvAS6fB3nmE7y3MTHYtwcXflRXQihZJoo=;
        fh=UiRyKMqSvHN3mLGMJct/mr2bkWfrBixcwI2ajrMA7RQ=;
        b=BrHxelZFFLF3e1VUE4hcsXIaeniusuwdXll/anqdDOiittX15VtgRQSo3/XY+BJCGE
         sKxK9OIuy6ZY4qXbPf+IsV8yiUu9uX6OzyBS6kk6nTMUc4m1tIxeD2i1fC+lQAyoZmIb
         y/TKKnDsggMKfceyabW0gtvv+KLV03GghWS1BEegIm1Hb/QJSTbStJbhxQ5VnpKEUN1w
         gFLSoQ/pXm3SnM+Bx81ly2w4meltS5+nhay2qOSSwE84o9oY2FeW6+MeDOIgPVCIeILD
         41CyT25//KGz+vutbRqL2hzvF4vNDbr7YaVSmJUVuksVpQC7FWO/1sqnDQCOyIF/qOYL
         sDhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769341609; x=1769946409; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i684QgbRLKrvAS6fB3nmE7y3MTHYtwcXflRXQihZJoo=;
        b=A5b85xBRHaiO12PZ3LZuZZFS3TplHtvEB49+I1Gw3Y6aWX8qdHUFvrLdk4h9n0FQLY
         RKGBj1Kgr90l0tlIXLL9wfm9acV+4XkaAVP8/UGj9kNHJ+9Qm93ZGOBs6TSKmgAianHw
         vS88wz9pp+QjmFgSfZXh1mX1p91I3hnFLqGyOy04kwROhQLFpYJLM/NmDKmluDI0Ke+Q
         KUd0LdTgj9fqPCjgErj50voA78USFkUHb+1W4WufpazlljEeGnHEGbfin13jXWVpTUyo
         7zAreIKs+Su6n3/DIGMzGdPhKEq2VfxE7iDieP9WK5FgVvultfo6YPgSpFBjpZ5ZYyqo
         bBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769341609; x=1769946409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i684QgbRLKrvAS6fB3nmE7y3MTHYtwcXflRXQihZJoo=;
        b=cbBQm/Iri3mo9vtUoX6GFMvtCWcMgYsc9QkArrnakPpqcERO31m+7yzdWGYanExPuG
         aU2GULqJeijzydidPAyH2yyq0yZ2MgYS0b22E5pri0uWjPCu18WPvRAQ4061GBxwV7iY
         YsvT4Nol6RGPMfqud2mNqoMRQ/8tCeNNdYXqwCvGZaqP1Rik3hEN+9Blixho2CJ94XpO
         tY2A6k8XNMYMdvQa8QmakGXUYZqBP73nyqgpEPLtZteJ50t4U0ZUUCwlZ1L5vbyggczo
         O4pNbF2tiW3sG/KYHiXs3W9fsz3tQmATPpM7az06rMRsV8BB7RG8VSHVZR/GljxK9Svg
         Z4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+aagkxeCFh0aPWsssUX/YT/On4wi80WA5aCEpqJvpfu10m0FWMks+70PQZXJrzX1HdzZzbBNwbFU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB1S20MCQLkAl37er0u4sdJTFlCs4tVSDCyEZZu7dcQL6LF1AK
	F+RBdFWbucjvbpY+nRMZQGrvPcztWj49qpVJZqLqA9nPgAE7yfwNoN2fvvjOPZ5wTowoamD/9Pr
	vnRuTKMYxQ8ubHUg01ZBR0q5B1RAKBlU=
X-Gm-Gg: AZuq6aIwfUHqDsxWmMtTV1cqNfwRoSzm2vkWyPtRp1KdX4shINmrVoRkYS+3jDPDFuJ
	QyG/vEDix+BtSotOerVTIaPZ03zff2KbyluG9bD0FNw5ox6jj6f1NaAbY4t3ZjZ4bJWHebES2+z
	fshmAIUci/e048AMMvHmbU4OFJAz2TGdQyrF0kPPklQJFFVZb12OieUa+JUrAz1wPg9bCO0CQ8g
	Co7AvifWAcyN0ZSBia5lEJr+o0Yj+pYO/xc5IWiXcsDGYw3Ou/kjN11IBvm9v+eRUB5Cjb2v1tq
	hbTD7noUoEFuB9fw7opHQ3Tczw==
X-Received: by 2002:a05:6820:1988:b0:65d:318:df67 with SMTP id
 006d021491bc7-662e046e017mr686789eaf.70.1769341609053; Sun, 25 Jan 2026
 03:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20260125085157.2462296-1-xujiakai2025@iscas.ac.cn> <9a818ca6-04fc-434c-b8eb-8380d5bb2293@web.de>
In-Reply-To: <9a818ca6-04fc-434c-b8eb-8380d5bb2293@web.de>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Sun, 25 Jan 2026 19:46:37 +0800
X-Gm-Features: AZwV_QhKu0HRlNcM2V84WhnJ8IQnK6kIoZewHlHU5YMVATY5DBBDBSwIJvzFh5E
Message-ID: <CAFb8wJu2fbz92oYiY6+KYk7wQVPe-YoQPo9sYNPo6bCW2SWw-A@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_034650_475949_E9FA1A2B 
X-CRM114-Status: GOOD (  12.94  )
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

VGhhbmtzLCB3aWxsIGFkZHJlc3MgaW4gdjMuCgpCZXN0IHJlZ2FyZHMsCkppYWthaQoKTWFya3Vz
IEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4g5LqOMjAyNuW5tDHmnIgyNeaXpeWRqOaX
pSAxOTozMOWGmemBk++8mgo+Cj4g4oCmCj4gPiBUaGUgZml4IGFkZHMgYSBjaGVjayB0byByZXR1
cm4gLUVOT0RFViBpZiBpbXNpY19zdGF0ZSBpcyBOVUxMLCB3aGljaAo+ID4gaXMgY29uc2lzdGVu
dCB3aXRoIG90aGVyIGVycm9yIGhhbmRsaW5nIGluIHRoZSBmdW5jdGlvbiBhbmQgcHJldmVudHMK
PiA+IHRoZSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuCj4KPiBIb3cgZG8geW91IHRoaW5rIGFi
b3V0IHRvIG1vdmUgdGhlIGFzc2lnbm1lbnQgZm9yIHRoZSBsb2NhbCB2YXJpYWJsZSDigJxpc2Vs
4oCdCj4gYmVoaW5kIHRoaXMgY2hlY2sgYnkgYW5vdGhlciB1cGRhdGUgc3RlcD8KPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xOS1yYzUvc291cmNlL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jI0w5ODItTDk5OQo+Cj4KPiA+IHYyOiBhZGQgRml4ZXMgdGFnIGFuZCBkcm9w
IGV4dGVybmFsIGxpbmsgYXMgc3VnZ2VzdGVkLgo+Cj4gUGxlYXNlIG1vdmUgYSBwYXRjaCB2ZXJz
aW9uIGRlc2NyaXB0aW9uIGJlaGluZCB0aGUgbWFya2VyIGxpbmUuCj4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUv
RG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni4xOS1yYzYj
bjc4NQo+Cj4KPiBXb3VsZCBpdCBiZSBoZWxwZnVsIHRvIGFwcGVuZCBwYXJlbnRoZXNlcyB0byBh
IGZ1bmN0aW9uIG5hbWUgYWxzbyBpbiB0aGUgc3VtbWFyeSBwaHJhc2U/Cj4KPiBSZWdhcmRzLAo+
IE1hcmt1cwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
