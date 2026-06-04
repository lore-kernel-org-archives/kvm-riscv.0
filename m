Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85A3CD6E68
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PK1DxEQM/ftrWeXc1YPSLFnFTZle9llmZC8cNGbQt4=; b=dFJlApuunE1PSP
	33oGKbVyd3jR2pfI1Nbx/V+sKkz/wxbg2OPuZ4zJ4pwR1V7AqxLH9ituyye2dv0cK4eB9x5Ju8SgA
	2jLXDWYvi4PYQ9jPoxgf+D3bGYmWYxsUYWYJqKToo2OMgA6TURtyFEee8tywGhQjMqSwwWM5vbi+B
	WkX8NDb0YbM+19be25sXSOf4snSQtcZ9/r6BdnPvXZdUwsrcOS3Fy34x3BZc4PqN/LXbZQjxEDUBP
	hR3hpjRlNNtSjFeqqjOsUZob365LXo38X9qq/bsXPVNzX7DeTmnK4o5Q3VvvCFsWFvRVNtr8HfpGN
	0fqFB1eS1Q52ZsTcAhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0re-0000000GBuS-2GMm;
	Thu, 04 Jun 2026 05:43:34 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0rb-0000000GBtN-03Sy
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 05:43:32 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51778077b28so3676611cf.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 22:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780551810; cv=none;
        d=google.com; s=arc-20240605;
        b=FdONVEXlqGzshPKmfKwVG/5chUUpuRdGOMvURGc4nJhaGmVIng79gKWSq0owK4gRp8
         QnJhGfsNDIUhsFALrJLQUHEGr6NkT1xjtZfkc2zvHoYqBk9hg1dcqe151DMrTvUUqYZS
         hqPVt8776jYZWZyw45laRkAH/9enVB152uCAQH5IL5nHfQm7Qju0E14qW/ZE9/j11bvI
         2AA837lYLViWlhJaDdHpQ0pQ/3q9TNH1AtsepqkMw8CA8tp9c397NpOn2BczCAdTHC44
         qtUMnkcAYZYigQ8m/eSKCkCi3ONvYr8wVkdbycR3WyuoLKD9AJBuBFMiWEZYpN1qA9df
         G4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2vjbEpBMrkd6U50bbMhDulG6rAcsMtJMj2QzzvisOk8=;
        fh=rbuEIzsYIr6/Ci4u+weYs2vcyXyAM8lWXjs5fQIK+YQ=;
        b=dX+XrM/8/pRwvhJN3nbwcq3CTZXWDVL0F0NRBMfrd07Xf2FJQ2XyptLWXby8bONJ04
         /exM8HiBZA/jMfiAdQ3IzRUsPQ5ipSN3JdZH6UZx+R1jzRgelNMyhguaik7v69t5rgs9
         TCxMF50Yj3xVAxdqaCUqLlVGtjNza4RQ24haJZob0ewzjUZrPhzk6Ywed/ye+ojTdRgR
         Bvc4DpEm14H/bztTnJag8hSxyNf/ztPpOIjXpswPmZxMmZDFdd5c9tKvjLnEtM1IoJMW
         q78+jRWOP6ShFWVu2XIp37uG57wKOqlDKTFnnV7bt4+IfXisrXYXlT1SyOtMJSP0gobv
         Ry5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780551810; x=1781156610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vjbEpBMrkd6U50bbMhDulG6rAcsMtJMj2QzzvisOk8=;
        b=Fy9XU0SXyKzLyBQxHY08Fq6YhdkV2xGfM03L6HsXsWbGPGT0RpTX+MXtw+iJUWBBnz
         lIYRgTaZgp06kmfm/kxYxesBGsyQnxpN3OvEKcJ67K1QA0awqShQ55a4TjkLrFuDxvCk
         OmVSgveGUxDOpbfslApCtPVC6PIIxCIjQNW5XHTKAOyq0UUiz60VDVgtScSvps/TEEB3
         RWHHbSfvTRfRPG57JNrPo1NQiZb5Nw7TdGiv/AD42cXbtQzPvXgJ3DaxGc/8Q2G0jFcw
         fpPBasTDwt5q4iZlLUNw/tR+in3JSkw99m4AK2IA6YsvhfJ8CPcl4X0lmJmPpa71St1V
         8AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551810; x=1781156610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2vjbEpBMrkd6U50bbMhDulG6rAcsMtJMj2QzzvisOk8=;
        b=XpHdwa/PeQyaL6fKtsB0vFgR/yGOFfJFuo6zHCeQSCUk0i6dCdR98/mqt3UPjpYqtk
         pfvg9jn2Hk2Rt2NV2FnRmcPDwFUDXJuWpsZUBmwe/VDfDDrdTGctG3o9o2xny6GSPtng
         k+3B3XXP5CXo56mWsxgvAP14LJOxNKJ1oJTGmJbrLcutnb1rvLftIbUQJgJRh35XUUo4
         hEQCzi9Z5bU37lpzDOdqUsax5lQau6lYW9EK90ySZTiIRVMm6wCoN8dRNQbzH6VSUH5L
         /ibL2zq6Q5115w/ef0FNXCcdUaGGC7GAX53Fj6TtsD/vSzxHF+lhvNsUh7B5g0Zkf3Bo
         oOJg==
X-Gm-Message-State: AOJu0YzADk6mnmCI2IkxsoJl+0amHou8mZJDS4u2dZdB1HluqlZPPtXQ
	XcdbeXdxjjOJOtSl5Egqcfb9tQU0Skl+asZpNaO+pItnw6Vq1CXlWJTlT//ZQHK2eV1wQfJLvrs
	PZtHV0wLaRI5hFxeVZmrHIIZGN5yAo3rPnWx5zZbclA==
X-Gm-Gg: Acq92OGBB2v1JZK4cBBb1hRe8MtTL3iLAvStU40YHDGZ7RBJGKeCQPOFmr6Ebd1TJgq
	3Ask/l7EcD0sOzqoSSpNHUCaoDkN0B88CpuAqX03apK+KEQPRDECKTh32jm64O4RphQqg0761s0
	CDmDCAN9UFvM/6XSeQJqvLHZCJqEOlcOTVaQxwJLOvSSXGSfDnwOmATvYxJzFY3B1qmfTdPNxt6
	byWWwVsmPrXL+tXCvLbNOOYNCfsvNj7kuwsQc5J3NbAqonfhil6Xu4iGWgWT/COd7I+rC+RyDIR
	Pv6laP1l8VmgNtCz0lAx77nsAcM/dS3al+ewr2QrzSzvXBKklTDzUdep67ubuI1BMrhHDYzSze8
	gQHkJ2h1/kcP65s8YdBDVv9YaBiz4Z8DCieog
X-Received: by 2002:a05:622a:1814:b0:516:dda7:51e0 with SMTP id
 d75a77b69052e-51778631404mr87800321cf.17.1780551809656; Wed, 03 Jun 2026
 22:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 11:13:17 +0530
X-Gm-Features: AVHnY4LKdTw-t4ZyqgvR4oG_oI5TCCSH84iuLHduTqP5duPhyYA_CKeqJZ0xlus
Message-ID: <CAAhSdy0LCXF677cBuS-CUBynUqWL7d_ra8+e+uOJurLm2nZzWg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Document a TOCTOU race in SBI system
 suspend handler
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224331_087768_389EC098 
X-CRM114-Status: GOOD (  20.97  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgNzowNuKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBTVVNQIGhhbmRsZXIgY2hlY2tzIHRoYXQgYWxs
IG90aGVyIHZDUFVzIGFyZSBzdG9wcGVkIGJlZm9yZQo+IGVudGVyaW5nIHN5c3RlbSBzdXNwZW5k
LCBidXQgYSBjb25jdXJyZW50IEhTTSBIQVJUX1NUQVJUIGNhbiBzdGFydAo+IGEgdkNQVSBhZnRl
ciBpdCBoYXMgYWxyZWFkeSBwYXNzZWQgdGhlIGNoZWNrLgo+Cj4gVGhpcyBpcyBhIGtub3duIFRP
Q1RPVSByYWNlLiBXZSBkbyBub3QgZml4IGl0IGJlY2F1c2U6Cj4gMS4gVHJpZ2dlcmluZyBpdCBy
ZXF1aXJlcyBhIHBhdGhvbG9naWNhbCBndWVzdC4KPiAyLiBPbmx5IGd1ZXN0IHN0YXRlIGlzIGF0
IHJpc2ssIG5vdCBob3N0IGludGVncml0eS4KPiAzLiBVc2Vyc3BhY2UgY2FuIGRvdWJsZS1jaGVj
ayB2Q1BVIHN0YXRlcyBiZWZvcmUgc3VzcGVuZC4KPgo+IEFkZCBhIGNvbW1lbnQgZG9jdW1lbnRp
bmcgdGhlIHJhY2UgYW5kIHRoZSByYXRpb25hbGUgZm9yIG5vdCBmaXhpbmcgaXQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gQXNzaXN0ZWQtYnk6
IFl1YW5TaGVuZzpEZWVwU2Vlay1WMy4yCgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4y
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gVjEgLT4gVjI6Cj4gLSBSZXBsYWNlZCB0aGUgZml4IHdp
dGggYSBjb21tZW50Lgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjYwNTIxMTQyMDMwLjE1NjA4NjEtMS14dWppYWthaTIwMjVAaXNjYXMuYWMuY24vdC8jdQo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYyB8IDE0ICsrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zeXN0ZW0uYwo+IGluZGV4IGM2ZjdlNjA5YWM3OTQuLjZmNjRhNTllNWQzYzQgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYwo+IEBAIC0zNSw2ICszNSwyMCBAQCBzdGF0aWMgaW50IGt2
bV9zYmlfZXh0X3N1c3BfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICAg
ICAgICAgIH0KPgo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBDaGVj
ayB0aGF0IGFsbCBvdGhlciB2Q1BVcyBhcmUgc3RvcHBlZCBiZWZvcmUgZW50ZXJpbmcKPiArICAg
ICAgICAgICAgICAgICogc3lzdGVtIHN1c3BlbmQuCj4gKyAgICAgICAgICAgICAgICAqCj4gKyAg
ICAgICAgICAgICAgICAqIFRoZXJlIGlzIGEga25vd24gVE9DVE9VIHJhY2UgaGVyZTogYSBjb25j
dXJyZW50IEhTTQo+ICsgICAgICAgICAgICAgICAgKiBIQVJUX1NUQVJUIG9uIGFub3RoZXIgdkNQ
VSBjYW4gc3RhcnQgYSB2Q1BVIGFmdGVyIGl0Cj4gKyAgICAgICAgICAgICAgICAqIGhhcyBhbHJl
YWR5IHBhc3NlZCB0aGlzIGNoZWNrLCB2aW9sYXRpbmcgdGhlIGludmFyaWFudC4KPiArICAgICAg
ICAgICAgICAgICoKPiArICAgICAgICAgICAgICAgICogV2UgZG8gbm90IGZpeCB0aGlzIGJlY2F1
c2U6Cj4gKyAgICAgICAgICAgICAgICAqIDEuIFRyaWdnZXJpbmcgdGhlIHJhY2UgcmVxdWlyZXMg
YSBwYXRob2xvZ2ljYWwgZ3Vlc3QuCj4gKyAgICAgICAgICAgICAgICAqIDIuIE9ubHkgZ3Vlc3Qg
c3RhdGUgaXMgYXQgcmlzaywgbm90IGhvc3QgaW50ZWdyaXR5Lgo+ICsgICAgICAgICAgICAgICAg
KiAzLiBVc2Vyc3BhY2UgY2FuIGRvdWJsZS1jaGVjayB2Q1BVIHN0YXRlcyBiZWZvcmUKPiArICAg
ICAgICAgICAgICAgICogICAgcHJvY2VlZGluZyB3aXRoIHN1c3BlbmQuCj4gKyAgICAgICAgICAg
ICAgICAqLwo+ICAgICAgICAgICAgICAgICBrdm1fZm9yX2VhY2hfdmNwdShpLCB0bXAsIHZjcHUt
Pmt2bSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh0bXAgPT0gdmNwdSkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0tCj4gMi4zNC4xCj4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
