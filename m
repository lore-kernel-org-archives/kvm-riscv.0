Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E6DCC6B00
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 06:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/m6kC8m55rtBvqLHgOu+i4bCCJlXjHu7i2yIMsuTL60=; b=kVmAiaQ7sctv7t
	GM/fP2eTA4yDxThkWCsB2dABH4D3IKXDnOwH/79KiDcf9thZEu4yA7w/Vomw6//Z9YbVHiHWAHzBP
	znBVOEQWx720g+jmP9MInlYBn/KRYnh2K+9rK9k7Lz1UDVjljWEeWJCvTlABKNtrw18Wh+wGbVBva
	GUHD14ASXgOVNfL3AB1lb7A3gRtfeF342Kg8RXe/nXm3Rg8dOBbk+yKcnPrF5M9n9czs4KvyYMF56
	1D9+Er6x2BjOuVg40kFV4YhRhu09OMtkWteYWlEWssIAQUmEOnFg4Q2u6uDrxUtwU1Y9LC5JL2FPe
	LF3HHlZiqchoQgwILWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BL0-0000000Grte-1Hqa;
	Thu, 02 Apr 2026 06:15:30 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BKw-0000000GrsJ-2AV1
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 06:15:29 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-67e2c70864aso325928eaf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Apr 2026 23:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775110525; cv=none;
        d=google.com; s=arc-20240605;
        b=OCmE2tClSr/AK4RbI4DHocdtuvEoLqW6iuciWoYCXUIlUnTkqnkfMjnRC4ahpbx5Eh
         6FeFcA9MSKeSlNYraOQYX+7EPjxfe2RvBul1imfJJURhUY80/TWTSueKXDGWjx4VHxP9
         1bv1OCG7/QyBPeQ1fxr0nICrjDj3SlNalArmkMPA40xZMheehxROrWnmM85Ppf3QCBdH
         VTPzw0J5MpRv/EqgVNa/Bl+sIagfKNTWDw+S+Dpx/kacSuQIOPwLZW6seB+QKs3Aeu+Y
         dm60t9OVGU+VYMbre1Va60Ve7C0dIaLyNIurBg1ZvZmxX659+NR8QoFPYmtEyr54X698
         Uz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gmm+ZuAZEoshHephNI5x+CZdRU1jdbvaZcO28wZCH1g=;
        fh=VaNuBfCzN+HigC/ilLshqiYM+/tSyECncrgK7/HXI5o=;
        b=GnGDTchu7FGZN/wHvw5HZnRyoKFcgyTwpvZvzuwQiM3b++jDqWjOHBqUwigtH9OzE5
         sQyCvZX+rCtkQeD7dtB18WOz5/WGMOdvctkifUXYgPHD7yfhQEWdFe1+lZtAGMqiFY/W
         AZq7Bc+PxCgD0R7ud6aQTykX1Y1N3TzbLeQhx62mnuV7n47cst3BjGcLwSu1xLmvgdtH
         QEepQmdUndLVvcU/rteJ5gtYAjcV1IVtLEKTXaRQuUxXLjGxfS9dV5PgcgIvzld1zKaY
         FqxPU5Ca2iEJitxkM+2iW0H0ZwoZ1+y5oM9N/tVFW/YO+sXqfXa8cnUAIDcRYuI0jYbF
         T+wA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775110525; x=1775715325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmm+ZuAZEoshHephNI5x+CZdRU1jdbvaZcO28wZCH1g=;
        b=B7BmjIW7hjmkcjGii5DsewLnpJQnFpmoTEt8RfTsx5eRiVEZ7G2Os1kuZtIxJT3Pdr
         fEiRpCVvsJ+pAUv0xk78kwlahitYRQYocHptp+gPdPV0YmreKrF3alKIeSXNCiOXR0wO
         fheRIBnWw5KIDvsCoKHmoZX7FUn8A6ttOlWWSdWENsCTDlWKkpYCzAgmrBqdOPBYVSgD
         LeC4xhwOHMCAPB19TeORsnvsZodz2IhvXG50t3GnOBDhUG2N0ITJJNiUQv8mf2jrxZAA
         6iEksRnGGtSktumVNibuqCvgwPyADtiXhzE+UMgtYkGz1VHs9x2ZTQSgWdXXdd83LtJC
         hQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110525; x=1775715325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gmm+ZuAZEoshHephNI5x+CZdRU1jdbvaZcO28wZCH1g=;
        b=qfPF7S9y1kF3gWb2QVIzTCaVI+IO6uDxCbinRPRtMBUlfbTSSmD0JVFMECOTvy1JU/
         nZVs1WX7f9cnLgSxjPLzSW1MrXXGU/VmZ8lwruH9/P99AD3mdCVUBZ9mZyziJWovDXpK
         tvtlEzc29qdbBAWIHk9wh5sIs7q4/rCce/zbTBqGH65RYrbA8Hjk4X3g5M3VSMponiPS
         ShiVzJGPbTZGmQwOnANhCfAcXxdf51BqOZPvD3MJzjkXsdRs249n0ijaySiZpnDll2a3
         csXQyOrlrwNpQL+NaGu7PiTwERYpg6iMp9ig4zP++gN+0TLl+7fUoaLIVpgSfk/KpZwQ
         2KIg==
X-Forwarded-Encrypted: i=1; AJvYcCWeh1ATbPwkngPyymI/dnEz/ruBFhA+BbKvGH0wgtVrosV8fwtvUat32pVKMb0CK6l9l06i9YLkaHk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFIQI5HN1AssR/ZKka3x43s5XUf2Uuf9Pko+FFHrdgkMcUVYzB
	xArYq18j75GweAfMVgSs7W16V9z5dSPHdSOg4TtiaJmUv6LVn+hEeI2grtCJUlhzbZPdyEpr05/
	aRfgTXljQcgel2ZCMDEK20ojHhbUUDCMkrTctOnnBAA==
X-Gm-Gg: ATEYQzy8jKzeiRuIrpt1MtDp1PHRi6Ydi0So3mCk3EC74iYAmqFkvp2nkY53muH+wNv
	lO1hTrGH95xy5h8RPMIw/i4eeZKHGNbZ7AIOItazhQnxL6qcWe2lW4wkfyaJnKizpEOC4s7OSvL
	255/UloiN7cSbrX4e/YDA4UHFKEvxrbZeWD7VVfqWY787wWxOjnvOzFYcMj4wl4QN8Hu5vP86Pw
	UEYg07YsWA19OWrzC8Ko7kzKK59bgtKPMqGOqmlT2k/9GqGMOUeDr3rny8DzTOLRzBSIV8jejRk
	ukk4hHUj3CXDIfsCLXGNyTi6dws3PrPlkoiGYWm4DHp1gx3aPNj/LxZvIdpZxWVeE6vrAXUQcFl
	BLJui0GvxoWxvqp1UzswSpG0NRTo=
X-Received: by 2002:a05:6820:2083:b0:67e:3c4a:eac2 with SMTP id
 006d021491bc7-67fabd0f6c5mr3266769eaf.58.1775110525373; Wed, 01 Apr 2026
 23:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3V2kipH8sPzXkmnXP=Sh=7wwqhHaAWDyucJnytbL+qtw@mail.gmail.com>
 <20260401104902.716329-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260401104902.716329-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 11:45:13 +0530
X-Gm-Features: AQROBzCXxzxKAp8muMDJJLpwLYO82PaRHrPCQ2ylV6QJVZYM_9h4TEWap2UJzSw
Message-ID: <CAAhSdy1tN1i3KZ_EmGPN6dz=DYSfGGxeiTCbHYA3GRezFD4Wiw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_gstage_get_leaf()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	jiakaiPeanut@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_231527_693711_2652AA62 
X-CRM114-Status: GOOD (  17.32  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCA0OjE54oCvUE0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IEkndmUgYmVlbiBmdXp6aW5nIHRo
ZSBsYXRlc3Qga3ZtLXJpc2N2IHdpdGggdGhlIHNwaW5fdHJ5bG9jaygpIGZpeAo+IGFwcGxpZWQs
IGFuZCBJIGNhbiBzdGlsbCByZXByb2R1Y2UgdGhlIHVzZS1hZnRlci1mcmVlIGJ1ZyBpbgo+IGt2
bV9yaXNjdl9nc3RhZ2VfZ2V0X2xlYWYoKS4gVGhpcyBpbmRpY2F0ZXMgdGhlIGN1cnJlbnQgZml4
IGlzCj4gaW5zdWZmaWNpZW50Lgo+Cj4gVGhlIGN1cnJlbnQgY29kZSBkb2VzOgo+ICAgICBtbXVf
bG9ja2VkID0gc3Bpbl90cnlsb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgICAga3ZtX3Jpc2N2X2dz
dGFnZV91bm1hcF9yYW5nZSguLi4pOwo+ICAgICBpZiAobW11X2xvY2tlZCkKPiAgICAgICAgIHNw
aW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiBXaGVuIHNwaW5fdHJ5bG9jaygpIGZhaWxzIChs
b2NrIGhlbGQgYnkgYW5vdGhlciBDUFUpLCB0aGUgY29kZSBzdGlsbAo+IHByb2NlZWRzIHRvIGFj
Y2VzcyB0aGUgZ3N0YWdlIHBhZ2UgdGFibGUgd2l0aG91dCBhbnkgcHJvdGVjdGlvbiwKPiBsZWFk
aW5nIHRvIFVBRiB3aGVuIGNvbmN1cnJlbnQgd2l0aCBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKCku
Cj4KPiBUaGUgZnVuZGFtZW50YWwgaXNzdWUgaXMgdGhhdCBzcGluX3RyeWxvY2soKSByZXR1cm5z
IGZhbHNlIGluIHR3bwo+IGRpZmZlcmVudCBjYXNlczoKPiAxLiBMb2NrIGhlbGQgYnkgY3VycmVu
dCB0aHJlYWQgKHdlIHNob3VsZCBjb250aW51ZSkKPiAyLiBMb2NrIGhlbGQgYnkgYW5vdGhlciB0
aHJlYWQgKHdlIHNob3VsZCBOT1QgY29udGludWUpCj4gQnV0IHRoZSBjdXJyZW50IGNvZGUgZG9l
c24ndCBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoZW0uCj4KPiBNeSBwcm9wb3NlZCBmaXg6Cj4gVXNl
IGxvY2tfaXNfaGVsZF90eXBlKCkgdG8gY2hlY2sgaWYgY3VycmVudCB0aHJlYWQgYWxyZWFkeSBo
b2xkcyB0aGUKPiBsb2NrOgo+ICAgICBib29sIG5lZWRfdW5sb2NrID0gZmFsc2U7Cj4gICAgIGlm
ICghbG9ja19pc19oZWxkX3R5cGUoJmt2bS0+bW11X2xvY2ssIExPQ0tfU1RBVEVfSEVMRCkpIHsK
PiAgICAgICAgIHNwaW5fbG9jaygma3ZtLT5tbXVfbG9jayk7Cj4gICAgICAgICBuZWVkX3VubG9j
ayA9IHRydWU7Cj4gICAgIH0KPiAgICAga3ZtX3Jpc2N2X2dzdGFnZV91bm1hcF9yYW5nZSguLi4p
Owo+ICAgICBpZiAobmVlZF91bmxvY2spCj4gICAgICAgICBzcGluX3VubG9jaygma3ZtLT5tbXVf
bG9jayk7Cj4KPiBIb3dldmVyLCBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgYmVzdCBhcHBy
b2FjaC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4KCkkgZG9uJ3QgbWluZCBpbXByb3ZpbmcgdGhpcyBm
dXJ0aGVyIGJ1dCB0aGlzIG5vdyBkZXNlcnZlcyBzb21lCmNvbW1lbnRzIGFib3V0IHdoeSB3ZSBh
cmUgZG9pbmcgdGhpcyBjb250aW9uYWwgbG9ja2luZy4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
