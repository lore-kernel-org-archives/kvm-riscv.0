Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F989C55167
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pL7C5Y1PaONpL8WYee/SokclDWN8id07P8/3ENLLP1w=; b=AbNsFmHsni+Gha
	kFgrafHoD6wgTOvEX02frRduZero7V9hXcHdfehu+5wzwLTZktgDScdaNUlAGDqHShwg1gO/uDtDD
	hqzy8pDcr6dvwmWtGpA/cFjXDgOfYAkInDteIUEXgZy5qnywLYfRTk8AOyZunn9Vxf8DtXZr6bacR
	qmkg/exb7GwjaGPl1EKsPvKyijymgGUXSY/si0yQNpDhO8xeAgNqG7AuitDPkdUztbVDO/dwbddJd
	CeZ0Mu5IiSxiStiChbmftcYTLA+QBCWmcgtgykj5WCwxMZLPBDTFFqdy3FfzMWM+DxdIJ1fCxaCx4
	U9vklmiJbIcDT7FWbtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgF6-0000000BrKX-2paP;
	Fri, 31 Jul 2026 05:57:12 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgF4-0000000BrJG-0AZ4
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 05:57:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5aec201b582so573593e87.1
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Jul 2026 22:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785477428; cv=none;
        d=google.com; s=arc-20260327;
        b=GsmmjVz96Dz6X4obSfggyyqOKHkz03PjYa50ksMWCLXOeeTE4as2rE49lKuLB4aKRQ
         Ag8iqEv323fS6K8naTF4TtiDt0JMN7KSAyG25a7SYWIpcmSCe1HYvicSs4clXgP5uqFN
         gUu7Y+tD3ocjT3k+7mW3HZH+9UALaG/D0IEygAC6iXTUfpsPQFTBnT2Yty3EDhg3WidS
         PphwD0pwvJe2lAkv0UeQ6znT8sWpusGN9vwSclKUcqrAnnE8ZowDGj1uT78oTOW8C20W
         7svoQBJIXzHitFZfQUygIeBjF8DRdIRe/DCsbvaDVb53l7pT2+kWa+oMQkISbiVRgzUE
         1rsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IipFgVRsoH3iYGVOTYy4qykSaenCoVmPpYiCJWUhT30=;
        fh=vscsbe/0GefmRU33E7zNijqpMgmpMnFXMYTeKezCLvQ=;
        b=p/bwBSOAmahm7NthKbQ8q69PYrQS6NxYVQvmLlsp1Gh8KbGjqPdYziOTsUd+vGHXFj
         iB62CKDKA0qaRVP/JuSSCTDUrVuyQ5y7WnZUP/meDLQvRdtMvfzNYbBRKZhaF3twSHLd
         4qVDvVkvKIniS20XJgzeW+IzqFZPqL2hzMadBU19JCnm9FezHa+rKEctdFZzt+0Xdtxe
         2Ujyb7xbHIqqJ8I1h7DUdm7lP5mfBfLmWsKVLa1iHQQ4w0NZQrWcRFbAa8Aqoa9lNmaV
         0Gn977nG3I9TTrBgu1WritoGh5fK66Koh4S92JDiRShgIjVjpcIBkLn3/nbVxfRtKfjC
         BoYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785477428; x=1786082228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IipFgVRsoH3iYGVOTYy4qykSaenCoVmPpYiCJWUhT30=;
        b=zWiKp5DO6ZlSpmEIHcQa+OqxDAN8Y1Sj3ZNxrPTIXnG3JxFbHsoJ3KawLFgv3DoAwB
         KxF3Piuc718/1VVaAxfLckzp6tzY8tVxlN2Lcm7DkF6A0Sy2afHJ+bRYF6TvN8MKi8jR
         0EagmGgSnV32aSEARNbA6fu588j2nGVSjm9IxS3YBHBQRJbJ41csPWAOA/c5wfOo2GZO
         PettrDAqUOztn9N5MxKheAGX674b3dcrkqjaLPsGdvUDl2ZMMlnMdxiqc58lxC6pVv5N
         SQCcSyZ4HE7Fb+4rsrOGBSfQpWRFB9bv1WVCaYYfZatBoxfmqL1YVkjMS0OsXqh/KHzF
         SIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477428; x=1786082228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IipFgVRsoH3iYGVOTYy4qykSaenCoVmPpYiCJWUhT30=;
        b=FAnTWaz8Opkd6PiOpnQLQHVFB6YbCcuoYuRL8/wGWwmenhU6C/TjPobkKtLGT0I7bs
         kkkdLgKRjAAvRRLhAe36D0CwqKlb6dVWop4A+SHcRdoB7VkOVDZ7aychkF/fPAsaSGqE
         G18tppGxFANCuwV96MtUSkrWk9U7LR38SJOT1WOHSWVTachteK6zS0TepF/BVEdoYjxj
         cI2vWosPYB/wdjR9+fYgyHfupzJzbKv/4ZVY9xYFvzSKe5YhDGgbsDRAzphzmba93+SX
         G0Aft82ywpEx1OOAnlb671hDfQ6WulzunVAwZPBxCKemRGZPLKxut3cGj1vLenQT15XS
         hKlg==
X-Forwarded-Encrypted: i=1; AHgh+RrOzoZy+fT1/7s6SMBXRsv2uIutpY2/v8vsNDiuv3YkjeGYRN4UAuurzpzM9NLpXWqWp9l36I8KIh4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cBZo8ILab4xYEeXJJXRN32m9hVAZ+oeMqMziXd1c3Oq4gRtK
	Ot58FmQpSYkrSr76wCptIZHHtbmln8HQfwzyMw71779Y5llKW9iwW6JbS1kqg9eF3y/3Vgah/xF
	edj6JSI9Dgv0lXx1bqGndVqJ+MR8B+NtGB25bu46cvSa2BPeo4bFcFkM=
X-Gm-Gg: AR+sD10d4HbCJ8GILJa+JBd588OxAr+6kjtPDcg+vMaXKWy96heL3vX7UziXEwX5dFQ
	es8S5OxJ9nPYebFJIDKsD9/X1gpeY2m0gSObqb/XtqREGCksGZo0ON7hRxZzG2PMOwKw+nv2v5c
	FCrBp12udxbd2wtdubG04UWHlj6/bLWAb0CqBTLEYa7Gsn9G83tIQX85RyHpJ+6eWPDcFqH5zyR
	wPuAEOzzPPjRy3W7DaaImFIcHSBAY9Y8fXPMEQYmjdNS4/OdvL7L1cIT4aP+Zzbj8wwHBQ9TbFn
	8PA9ZBkLJDPs88uYvzS6Jqm0Vh33amBfpee7W6rg/1/ahGIgCQlJtldrJhULgEJMe5HtHAc6ZDb
	0zWof5deOIYwJ5jpjL6WMzI8WwYLZmtpLU93EJjZbesIkZE7rjALCNT/4mzPImQZB
X-Received: by 2002:a05:6512:a93:b0:5ae:c3c1:822a with SMTP id
 2adb3069b0e04-5b2e1fff9c2mr193171e87.58.1785477427605; Thu, 30 Jul 2026
 22:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2026 11:26:53 +0530
X-Gm-Features: AUfX_mwuaZ3aS-ay5M9hKbAlT0MobWOtVi1EJNb4YGPNHeO6jd96joBWaB7jDwQ
Message-ID: <CAAhSdy3bBQTwj80cmBvWYfqWgO1e8_Y85x=QG46UamGEbYy+UQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] RISC-V: KVM: Optimize hfence request handling for
 SMP guests
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_225710_103598_02BE5053 
X-CRM114-Status: GOOD (  16.30  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCA2OjIy4oCvUE0gV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFv
MjU1QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIGhmZW5j
ZSByZXF1ZXN0IGhhbmRsaW5nIGluIFJJU0MtViBLVk0sCj4gdGFyZ2V0aW5nIHNjZW5hcmlvcyB3
aGVyZSBtdWx0aXBsZSBWQ1BVcyBhcmUgcnVubmluZyBhbiBTTVAgZ3Vlc3QuCj4KPiBUaGUgZmly
c3QgcGF0Y2ggSW50cm9kdWNlIG1ha2VfeGZlbmNlX3JlcXVlc3Rfbm9kYXRhIGZvciBGRU5DRS5J
Cj4gcmVxdWVzdHMgYW5kIG1vdmVzIHRoZSBoZmVuY2UgZGF0YS90eXBlIHZhbGlkYXRpb24gb3V0
IG9mIHRoZQo+IFZDUFUgbG9vcCB0byBhdm9pZCByZWR1bmRhbnQgY2hlY2tzIG9uIGV2ZXJ5IGl0
ZXJhdGlvbi4KPgo+IFRoZSBzZWNvbmQgcGF0Y2ggZml4ZXMgYSBtb3JlIHN1YnRsZSBwZXJmb3Jt
YW5jZSBpc3N1ZTogd2hlbiBvbmUKPiBWQ1BVJ3MgaGZlbmNlIHF1ZXVlIGJlY29tZXMgZnVsbCBh
bmQgdHJpZ2dlcnMgYSBmYWxsYmFjaywgdGhlCj4gY3VycmVudCBjb2RlIGFwcGxpZXMgdGhlIGZh
bGxiYWNrIHRvIGFsbCBWQ1BVcyBpbmRpc2NyaW1pbmF0ZWx5Lgo+IFRoaXMgdW5uZWNlc3Nhcmls
eSBkZWdyYWRlcyBoZWFsdGh5IFZDUFVzIGFuZCBjYW4gY2F1c2UgdGhlaXIKPiBxdWV1ZXMgdG8g
ZmlsbCB1cCBwcmVtYXR1cmVseSBkdWUgdG8gbGFjayBvZiBwcm9jZXNzaW5nIGl0Lgo+Cj4gV2l0
aCB0aGVzZSBjaGFuZ2VzLCBmYWxsYmFjayBpcyBhcHBsaWVkIG9ubHkgdG8gdGhlIFZDUFVzIHRo
YXQKPiBhY3R1YWxseSBuZWVkIGl0LCBwcmVzZXJ2aW5nIHRoZSBlZmZpY2llbmN5IG9mIHRoZSBu
b3JtYWwgcGF0aAo+IGZvciBvdGhlcnMuCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIEZpeCB0aGUg
cGF0Y2gwMSBicm9rZW4gdGhlIEtWTV9SRVFfRkVOQ0VfSSByZXF1ZXN0KFNhc2hpa28gQUkgcmV2
aWV3KS4KPgo+ICAtIExpbmsgdG8gdjE6Cj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2LzIwMjYwNzA3MTEzNzE1LjQxMzI2NS0xLXdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24v
Cj4KPiBXYW5nIFllY2hhbyAoMik6Cj4gICBSSVNDLVY6IEtWTTogSW50cm9kdWNlIG1ha2VfeGZl
bmNlX3JlcXVlc3Rfbm9kYXRhIGZvciBGRU5DRS5JIHJlcXVlc3RzCj4gICBSSVNDLVY6IEtWTTog
U2VwYXJhdGUgcmVxIGFuZCBmYWxsYmFja19yZXEgbWFza3MgaW4KPiAgICAgbWFrZV94ZmVuY2Vf
cmVxdWVzdAo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jIHwgNDYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQzLjUKPgoKVGhlIFBBVENIMiBpcyBh
IGZpeCBpbmRlcGVuZGVudCBvZiBQQVRDSDEgc28gcmUtb3JkZXIKYW5kIG1ha2UgUEFUQ0gyIGFz
IGZpcnN0IHBhdGNoIHdoaWNoIGNhbiBiZSBhcHBsaWVkCmluZGVwZW5kZW50IG9mIFBBVENIMQoK
UmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
