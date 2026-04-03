Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9AEE7E351
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW0OXBCbKvvXbBc9YuyV1cAo4e2JTwoVmPCbO2DY74Q=; b=bs+/4Kjf2VpXOj
	1lZGxXGoW08f2aWWvcWHDgKaiVNJkM8UKHhdzE3oDzzko/rM9pQlrRHKMiPqQqTmswCG/DVuo46j1
	iag3UZB/kjdX924EeqfUhnQ6Dj8KyQcpe9djVQ9KGJaSo8pqdNkCY95o6qnzUQ4YQnwAEnKnMZbWd
	vLcxmHCl9mYepK1vHiv/GAMK3G7OW9tfSbYNw/kR6pJ+erAZ5nBwUAmXyKsOEfEhoFCFqrgi1gq5D
	lB0vuyHZZx2/EXptN6YuJpNrZG8GEpG/3Fuv+bjObhJS9L9j3G/jOGQQzNtCDXqqLEw2G3VjiV0dC
	fUwnspUZF89h3hgqHAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aTJ-00000001m0w-2lEw;
	Fri, 03 Apr 2026 09:05:45 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aTG-00000001m0D-3X5x
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 09:05:44 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6825009f4f5so175332eaf.3
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 02:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775207142; cv=none;
        d=google.com; s=arc-20240605;
        b=LSMvDy1BErW/XY21ryjA9KPb9wa+LVbbJ5Fe4/qFo0olI+TtMmQep/N0DxSPaEtLMt
         h3adWqvDVzFV2pb/hgNIRBnbYNZ9PstJ8raZreD0bzPJpdadoPxq4IhTaJ3tdxrzJtiW
         Ilejdh30fBLypVrmghzB78BlFYYn5QjoFuUEyyLjH9vco1+UOnWDX/43ETAT4ADkBbhJ
         6NeDQODzYV2z1XpSJfcep48pwL6uRNYL6e64VZwTGQK6DKXwv75B1ax0gpxYVeBU0p19
         rRbQLrAV/5GheOvnebgPpO7bgzuN6sHqlmBlnSBEiDnPyOgCIb81Q6YAutxUw4cRN6VA
         +Zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        fh=tVSa8fXZ69f9eeJoCG5yg2L+bBoVQW3YCxydS/Vm6UI=;
        b=hN4FRB3NUGIdB4h2rYFUECSdsxy7csIxcNzP9bBXKAdZIySLhCc2X2PfbwCnl8c8at
         tEDQzUA4xp7WfF/KmFeFDSQ5dfWWhqkc3zsWyny0OW1mzs+NFMmliKIsK+xipeheW8F0
         iemv37jmneFUXuxc5Q8rDl+UnUJFJ/BPlIBEBJIUtkJDb7Jn/IezA2aB1DuIZBAlLYky
         dLXK8v11CbsRuTLyNz4LY9ChRib8+jZAw2VgZFLcxmT0COnfknUHe/o1ABMObzcLwFQK
         lprFjgy2GtauvnPZOQ20DK6vFUF7elZnSB7cKex2l3CSEAF3qL8Ijv35vMu/0+EkxsBf
         KUGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775207142; x=1775811942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        b=BRXBO63TBeYneGhALqq4lGKdeLP88mqgKtMWdT+t1s+U7AlGnJXchsY4k4fZWPElJB
         l9BLBb8c4AAVoqcECe0puJ9oMiO/uSRNL95cy4BBtJI1qKUIldIeXkcBJhidMqYINHGG
         d/W3LWOPloE/stj4IDLvi1lBb5tYfg6gJrCcGY4gTpmQBr3IYYCKn3yTAhhy2e3MdylP
         +I3C+o7waPkO79olbfqb5VpQOzc3j5Y31k01MHJEKv3dvsVrIUROnzKobB1tMrRxKujF
         H7FTTn6pemzLsnnj8uy2xWk73ZYi7YKKBSxtMs5RgKUI5ibKechNBObJaJSM2Wfb25sa
         700A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207142; x=1775811942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCm4AYakB9dKG7bybl0vV8lp+2k4EkmvPsl1dYhbfsg=;
        b=CPrgWhEXWDVRYGYvTdPKJ7GieE1UesKz8lqXRZvS59jZax6QPDgzAVoN7BpNNeuVgM
         WjVv8lunCVnRk+xXkgxz2iiVJ/4jncjAXRr2snoD4ECcZUQFa6La/sInTfEMD9UwYcLE
         oPJCcWAgYo81vx0Rzj2ZrJtVxQposyxaMnc5AQiQdmRIxYWt2Qli/Cjer90YCXojevO4
         EtEesB6A6Es4RV7SSD+/MVZNcPmJ2upfDkzpoc7P4O0faeaRmIxmo0jlgLOPyAnEsYPK
         TusqzPfWTxDKMgLITk2n30A8UOYzB9Jwtsc7KTObBTZjrjHzA28J+OZDl32g3ia7ZRlG
         ZuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQAhqAMLAVxYolfVZ+SHKVcQJEekFyTyfsbDqmlSR7BUp/U4oRIppoqXpm33nq23R/NPPZgBQF6sM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG8AO3N7ZOfs7sSC95IchqXgSZdpNlib6kzvWKl3HFExzLmGXG
	zeIs9+PgpxQHBMnMCHH2V0Lr0P+aEAW4cGXRwyTza2T4TTYm3LPGN3Fm9Dn5E1i2IokCeJXx3CQ
	GFeWT8JmIXEp4eq1R5EoclqFKydEG9qsXq4luY+KA0A==
X-Gm-Gg: ATEYQzwPQwl4nWZBjgzBDN8HrcsfWbcMnpyob+S1OAyJnOGAWy09N8xZlC5ZY5IZbjz
	h8TbWkj2WTLHM0DzHoDtuGP2r2456AaK/67uz+eutxxXcYhknozCNhotiqjFOVLmYxSkelsOFpL
	REP6ZPKhUzekB9bwDlbLEWh9ruB7oq4msBEUuxPGVXad3p57ax9gTTaa/Ayt7AsTPJwNCt2ouKO
	bSAAc3M5+7S8IqjN9yOa+1kngJH7qQo5RXIE6Ko/9gTG7MUCIEel3UT4vynW560DJyPoifZTZN5
	DjnrXAAMHF8YPiefUUCEKVdQaMH8Sv0NDXB523xFgb3SzRPbe5It3/2/GWzPTuwKqaS/EQOx1Ot
	owNOXkai4n28rJ/wt9IlmWQv2yg==
X-Received: by 2002:a05:6820:81d4:b0:67e:cf9:ea19 with SMTP id
 006d021491bc7-68221fffcb0mr1063073eaf.59.1775207141789; Fri, 03 Apr 2026
 02:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 14:35:29 +0530
X-Gm-Features: AQROBzB9KrI_BrZ8TmyJzBaJ6ObiJnp2kmnWownjmY2mr4UtyY1LfTWXeuUiIwY
Message-ID: <CAAhSdy3dqmamQX6dtxhXasFmYhS=j3YheSLnBv_sh7A3FZJLVw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_020542_875454_5F9393FF 
X-CRM114-Status: GOOD (  12.93  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAzOjUz4oCvUE0gTWF5dXJlc2ggQ2hpdGFsZQo8bWF5dXJl
c2guY2hpdGFsZUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IGt2bV9hcmNoX2hhc19kZWZh
dWx0X2lycWNoaXAgaXMgcmVxdWlyZWQgZm9yIGlycWZkX3Rlc3QgYW5kIHJldHVybnMKPiB0cnVl
IGlmIGFuIGluLWtlcm5lbCBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBzdXBwb3J0ZWQuCj4KPiBG
aXhlczogYTEzMzA1MjY2NmJlZCAoIktWTTogc2VsZnRlc3RzOiBGaXggaXJxZmRfdGVzdCBmb3Ig
bm9uLXg4NiBhcmNoaXRlY3R1cmVzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxl
IDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBm
b3IgTGludXgtNy4xCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGluZGV4IDUxZGQ0NTVmZjUyYy4uMDY3YzZiMmMxNWIw
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJv
Y2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3By
b2Nlc3Nvci5jCj4gQEAgLTU2NiwzICs1NjYsOCBAQCB1bnNpZ25lZCBsb25nIHJpc2N2NjRfZ2V0
X3NhdHBfbW9kZSh2b2lkKQo+Cj4gICAgICAgICByZXR1cm4gdmFsOwo+ICB9Cj4gKwo+ICtib29s
IGt2bV9hcmNoX2hhc19kZWZhdWx0X2lycWNoaXAodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJu
IGt2bV9jaGVja19jYXAoS1ZNX0NBUF9JUlFDSElQKTsKPiArfQo+IC0tCj4gMi40My4wCj4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
