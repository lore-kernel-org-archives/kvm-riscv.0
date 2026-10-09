Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3CECA601F
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Flp3f2JmXDx44dojgr4ErLUiehpSvsFtJsDuPiLmKc=; b=CGKn33C4bbrcN3
	SKtjME8nM+c0A/d0d3ZMEurc4oIrnPI/KY8nOOF8LtyV3ILdRr+6CUb491B3t4IWKtRGHdoucLfFB
	/XxC7njZ9nLHycq8GlPMhQ8SxDkNDBwGCkBcozeE2GVReVLVlQDJgtYx22eUgThJM7OcEiVzd8pMH
	zvbAjcG5hmr9I7GCs+AoVz3RblP50YtqjrIfgg65B8r4M4zCzq+JJw0QZWyp4AyBPmbuBjJO8gPgb
	8NXV0YtYKE4LDN2Il/LIntdX1xDSR8wjCGd2FtvBxxyOQxv/DZf1uFk3BsE3ykXxP7c1kt9qX9PDy
	VBb/tniGpPXdxXYTVICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGe7-000000078P6-3aeP;
	Fri, 09 Oct 2026 19:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGe6-000000078Os-1yel
	for kvm-riscv@bombadil.infradead.org;
	Fri, 09 Oct 2026 19:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=; b=HIhT7WDwxz86yVeT69y8R8roAN
	o6zT/GcBaCQDsdOV65lfP444NaIqAPXRAG3v6Avj/HE5zO4zC0KK/qGxGrDFSsmKiokGlT2NIl0Wz
	VQnHmtv6G66XWINblbOdZky5i2oYuNnNfZLZSqzOFsOr5XguKDSmsC5iTzCF+Fx1qmlOiOxYonNYC
	e2/2Ttfsya+7GL9JeKr7FgFm+aP1iLLvkCXvGQKrgvcnhMSpUYBzrlWFQNrdItpNyLoeU57LMEjZ5
	FF3OSi8EY6HmBUZ7ahNzJzRHtl5MZ8rDQVvIFTUSS1fyRtqN0vwnBiA82KYfUNPk/La6b/Yl7MTeZ
	PzVwpXbQ==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFGe3-0000000Bbdq-0f8Q
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 19:52:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso28386e87.0
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 12:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791575561; cv=none;
        d=google.com; s=arc-20260327;
        b=HFCSjU5r9S/58cjRYNen8RfR4DOhu6SbRUeY4Q36l3AEUjcUvZ5Vpmgjmrnknuc2lh
         6UgP0mRpWFzXfqxHjYtbB32UeM0cIjQUoVTfVjn8tFEQf09FwgIvyKI2rNWOCsE3QlN1
         j5YKW3iYaLVYMEelxz5xETrUUxKeZFGDvcOQjZT1sd6H/dd9FvX3xA+h3NPN0gS1dZPm
         Lk2ez1IGwOce6SF2Rgs5JqjV00U/844RikWLZ3TA4ApRtEtgBsArN/Lmv1HX9oAC0u9W
         aoEJ+m+3q8ELHc+9LPrH+WbE+5RT4AWtz1UeUJ5sTx/jg7Fdl839pTVfU4QI48otCX7m
         U8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        fh=k72dD496QoHfhPWDNM4zAIwKHDGu5+MXaf6Ouh7NV7o=;
        b=WaweFM9wgNIVf1k5PQ8JiirZ8pM2TiLawTbv7GVyi4uU0Td2nNS0nqxv4eY3MJiDjO
         3xqQAmCd5n/vaHrQpF7gFwmdCQ4ravs/e1EiYPzl8AIovh2J3CEDJlsH/IDpFU1BZw7d
         rZEH10WAyKdtoBFV435/e1yu0gOfDUjJxF1Dv/+n83fpq3XjhUHLDQ+UhIT/fI/MG+Gs
         iv2WeLxBUr3vy6bROHkvHDIrxZKiOQU8Px4YEOUVZKPxmrEPrsdI5t9tEV8RKMf06C9Q
         MArukA8AFwUOgL4efrOem3HzYz2XW113XtGZuaojy0824zsb7zOkdk+N2yLE5rnVNLvz
         wYqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791575561; x=1792180361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        b=QM/i9wISKop65N247GJmO/NFwBk6StEBU+JYZCmauo6YcXODTj/b8OHbl62R8IrbY3
         VpijuSb1xrrjAe5feZAyoV9SWG088HONSBL64JM7dvx8wdgUA9/B+j4ukeGhANXQdhFW
         NfKCb3XROopaSu6e8A2An/CCU4LPyoJ+uIY1NmPMvd6YJ0S3d9Di4K5ho8KxFG8ZHMSd
         F9vxIydrpkFfgmo8GQJMDj2kv7hQqktI2IqWsWSXDXnZ0xcCOINAQhIAkw4h/mkIelds
         O6YnITdyiHGg22EF3GktO9A3d1dAUH5JJDdHNtoW1KPHX3MNO7adjsAkGeOV+/rXaiuh
         spRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575561; x=1792180361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        b=nXo+XNaNpGWk0BAVwf00+qwi7ThWKpuJqU30iac70ic5tk7BHBot/ayXGHrXbB8Diy
         PkHeWNkiWw3QCGRmDVCYsv/05tWtJEWJ9pMOoSZ9HCqzg8knlWPBnj0HNyz7YCrUeJAi
         W3HxAftDHS5qWroJYhs5XZEZwgwWuf7zn47wt+2bjdMAsSsZuzVei1LLQ/G6n3b6yh40
         yP/CsXrymrgqmeBQESovaZHaaKRTsGTNp+cyejoADYV0ixBrn+DypFLCZxCEqChX+uQt
         eaXcaw1661zyUADAxbEbU2YnADzkbyve7qpPBkiGbYfi7y3ophlQkpGzajywSOyVd7fD
         5okg==
X-Forwarded-Encrypted: i=1; AKwUvBxmlTz7ikmDfEF9L37cGhQZNggJHRSoEv+3raeJAU6UkAYQiNg5Bq3XtpyrEv34zXewntrg1oNU2uQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLHiIeGqkyRr6QqAS4mtVTqAAiXPuEIWVovsNam6pKihToUHUQL
	56HvFKZz2timMR2CGwfzPpKhVNoUSaQJ5swqhD+9dYCk4LFWWSSfVZwuy5t2PY7hSgxvhTqqeIf
	Nou/ZT5h5jwbQeDJRCCH3G0syIJ0hZSmcv79JakfEww==
X-Gm-Gg: AYBFou3cN4dB7kyvPJ9wZlEjMePuyAJhpFFuCIWzYcd++2AfeswY69af828VQRKqEvv
	YUTmALP84MedzTILRRbPX+V30/m6vVZfUfuln8vTPAQxjhfDu/nvdJWu/L6+aZsd/D4Z3qPPb7h
	vmqZL/fj7zWDtvJdGgX5XCxwfZlOHiG8QLWMjvcv4yeiaRy+NYOdPYwf0s49dV1AMSH1Dya4+dq
	BljoqzFI1wWktJXAWFfvU3gWF3hED/VpdfYS9lQ0PKk77XKaFVYmJhBd9HhOqu8zmORuLFE012E
	EyiSing5AvlXMTmkte59YL6jvuvHQZ3DZcHsvlqqt6Kw1AMprJOPRP+A2aQGgcqP01Lpa5KppwV
	xx3wvUSxpeV/LXjrA7WlY4qy8/jLihkVM83iYrecO/rO6OAxqdF/z4K9zJgwHWCRkkXmljsSr5A
	==
X-Received: by 2002:a05:6512:6c4:b0:5ba:3888:7055 with SMTP id
 2adb3069b0e04-5bcde8d8587mr987668e87.48.1791575560885; Fri, 09 Oct 2026
 12:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260917122012.2577-1-yuanxiaofeng@eswincomputing.com>
In-Reply-To: <20260917122012.2577-1-yuanxiaofeng@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 21:52:29 +0200
X-Gm-Features: AclHuK9LE_K8n8SBL5vcZdIBUie1cZWxyC_Q9G86b62TjkF_wne6tghiR0d8MC4
Message-ID: <CAAhSdy0CWoLshP7GyONS2E-wYOZF8hEjbBosOnc74LvtjkUbDg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix IPI delivery for out-of-order vcpu_id
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_205243_404727_CB812956 
X-CRM114-Status: GOOD (  22.80  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMjoyMOKAr1BNIFhpYW9mZW5nIFl1YW4KPHl1YW54aWFv
ZmVuZ0Blc3dpbmNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSBJUEkgaGFuZGxlciB3
YWxrcyB2Q1BVcyB3aXRoIGt2bV9mb3JfZWFjaF92Y3B1KCksIHdoaWNoCj4gaXRlcmF0ZXMgYnkg
dmNwdV9pZHggKGNyZWF0aW9uIG9yZGVyKSByYXRoZXIgdGhhbiB2Y3B1X2lkIG9yZGVyLgo+IFNp
bmNlIHZjcHVfaWQgY2FuIGJlIGFzc2lnbmVkIG91dCBvZiBvcmRlciBieSB1c2Vyc3BhY2UsIGEg
dkNQVSB3aG9zZQo+IGhhcnRfYml0IGZhbGxzIG91dHNpZGUgdGhlIFhMRU4tYml0IGhhcnRfbWFz
ayByYW5nZSBtYXkgYmUgcmVhY2hlZAo+IGJlZm9yZSB2Q1BVcyB0aGUgbWFzayBhY3R1YWxseSB0
YXJnZXRzLiBJbiB0aGF0IGNhc2UgdGhlIGhhbmRsZXIganVtcHMKPiB0byAiZG9uZSIgYW5kIHN0
b3BzIHNlbmRpbmcgSVBJcywgbGVhdmluZyB2YWxpZCB0YXJnZXQgdkNQVXMgd2l0aG91dAo+IGFu
IGludGVycnVwdC4KPgo+IFJlcGxhY2UgdGhlIGVhcmx5ICJnb3RvIGRvbmUiIHdpdGggImNvbnRp
bnVlIiBzbyB2Q1BVcyBvdXRzaWRlIHRoZQo+IGhhcnRfbWFzayByYW5nZSBhcmUgc2tpcHBlZCB3
aXRob3V0IGFib3J0aW5nIHRoZSBsb29wLgo+Cj4gUmVwcm9kdWNlZCB3aXRoIGEgbWluaW1hbCB1
c2Vyc3BhY2UgVk1NIGRyaXZpbmcgS1ZNIGluc2lkZSBhIFFFTVUKPiAoUklTQy1WIHZpcnQpIGd1
ZXN0OiB0aHJlZSB2Q1BVcyBhcmUgY3JlYXRlZCB3aXRoIGlkcyAxMDAsIDAsIDEgKGluCj4gY3Jl
YXRpb24gb3JkZXIpIGFuZCBzYmlfc2VuZF9pcGkoaGFydF9tYXNrPWJpdDAsIGhiYXNlPTApIGlz
IGNhbGxlZAo+IGZyb20gdmNwdV9pZCAxLiBCZWZvcmUgdGhpcyBjaGFuZ2UgdGhlIElQSSBpcyBk
cm9wcGVkIGFuZCB0aGUgZWNhbGwKPiByZXR1cm5zIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsgd2l0
aCB0aGlzIGNoYW5nZSB0aGUgSVBJIGlzIGRlbGl2ZXJlZAo+IGFuZCB0aGUgZWNhbGwgcmV0dXJu
cyBTQklfU1VDQ0VTUy4KPgo+IEZpeGVzOiAwNjExZjc4ZjgzYzkgKCJyaXNjdjogS1ZNOiBGaXgg
U0JJIElQSSBlcnJvciBnZW5lcmF0aW9uIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFN1Z2dlc3RlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBYaWFvZmVuZyBZdWFuIDx5dWFueGlhb2ZlbmdAZXN3aW5jb21wdXRpbmcu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuNAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBsYWNlLmMgfCAxMiArKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gaW5kZXggNTA2YTUxMGI2Li5jMmYxZjdmMjYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gQEAgLTY0LDggKzY0LDE3IEBAIHN0YXRpYyBp
bnQga3ZtX3NiaV9leHRfaXBpX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qg
a3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh0bXAtPnZjcHVfaWQg
PCBoYmFzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGhhcnRfYml0ID0gdG1wLT52Y3B1X2lkIC0gaGJhc2U7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBr
dm1fZm9yX2VhY2hfdmNwdSgpIHdhbGtzIGt2bS0+dmNwdXNbXSBieQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAqIHZjcHVfaWR4LCBpLmUuIHRoZSBjcmVhdGlvbiBvcmRlciwgd2hpY2ggaGFz
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogbm90aGluZyB0byBkbyB3aXRoIHRoZSB2Y3B1
X2lkIChoYXJ0IGlkKSBzcGFjZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRoYXQgdGhl
IFNCSSBJUEkgb3BlcmF0ZXMgb24uIHZjcHVfaWRzIG5lZWQgbm90Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICogaW5jcmVhc2UgYWxvbmcgdGhlIGl0ZXJhdGlvbiwgc28gaGFydHMgb3V0c2lk
ZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRoZSBoYXJ0X21hc2sgd2luZG93IG11c3Qg
YmUgc2tpcHBlZCBpbnN0ZWFkIG9mCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogYWJvcnRp
bmcgdGhlIGxvb3AuCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKGhhcnRfYml0ID49IF9fcmlzY3ZfeGxlbikKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGhtYXNrICYg
KDFVTCA8PCBoYXJ0X2JpdCkpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gICAgICAgICAgICAgICAgIH0KPiBAQCAtNzYsNyArODUsNiBAQCBzdGF0aWMgaW50
IGt2bV9zYmlfZXh0X2lwaV9oYW5kbGVyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9ydW4gKnJ1biwKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZnco
dG1wLCBTQklfUE1VX0ZXX0lQSV9SQ1ZEKTsKPiAgICAgICAgIH0KPgo+IC1kb25lOgo+ICAgICAg
ICAgaWYgKGhiYXNlICE9IC0xVUwgJiYgKGhtYXNrIF4gc2VudG1hc2spKQo+ICAgICAgICAgICAg
ICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+Cj4gLS0KPiAy
LjM0LjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
