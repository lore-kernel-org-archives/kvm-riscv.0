Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4021CC6B33
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 22:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M8lKibg1VEmNw9tPKSG5XfFNwmUxiZP1wjAcpat6UA=; b=lCiRCCnpAcv23p
	HWOAi3A0m7eAYpoCXivACd8vIgkLlUaJIbDVGW6a42nHhQwrm81S29skglZM3GWe4xUVs1UuhIEbB
	o3+MFC1LZBa1bfS9DdHpUGUsEXIN2pUU/UqrmbWWSTFkBlM0NPSTmm53EWVve8gWvfnxShJYaMibe
	kqxjVsxpC2JJQGYR5hxoSL9UTDqpIE0Clt7pwJ/M0YTwJdxgd7QwCtP2Vo6uGxSVPN6GtlKYj79Qf
	Sn6DaQXM/5pKs8XSGqN6ZuREHWoHspHKmyHWKlw7/Zy5GgUipgTJy8//5bZoonVGbz6iBNRjUFv05
	prE+CLyqxM+a/YzsQrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gc-0000000GQ4G-1IHS;
	Wed, 14 Oct 2026 22:43:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7ga-0000000GQ2z-3T92
	for kvm-riscv@bombadil.infradead.org;
	Wed, 14 Oct 2026 22:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=; b=FY7ZC+po3Cmi15ztY9TUXwQpp8
	SvgOm0njyK5ZfXmCFBD8iQjdVHvKa9V6VSt9X83CGqtH+GHP2NmxPXs1vCZQEEXxtph62Lc7MfH7F
	MrUYqQvUCjLfeAsnNtGfskhNXpadc1dPKNx/lGpnGq5ZNf+p4tLh0SB2qx0SzZ/UNCrf+gL/JoXCR
	GAbMJUmiRR6hf7YBDzPkQOYf0CABYSDhqgXtY89qXpNp8nXrRiiUBpCHEtjDpBFwoEWJzLHDEze3y
	wfBq9xbfQ3vB1ULi0hFaJy+OvQ0jVVIX9Poainoi0JoSDk6CA2PwY14hWb2n+Nphr4/5QKRTpUepA
	aPrKhygQ==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH7gX-0000000HGYm-13tJ
	for kvm-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 22:42:59 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D0B9640252
	for <kvm-riscv@lists.infradead.org>; Wed, 14 Oct 2026 22:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017775;
	bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mCyY4jhJ7ZcI7KPXDeIzGwVCxBKUoI8uwCSvNUnOhKAYsNVzpRR9r9FqHliqmWXKf
	 dFVEB9WbdK01k4cUqfzyCxA4rbN082iwp7XLjkQlz2RBKs7XQo0SHVtHi6zwfTaq9z
	 SB96uLSzcDkQ7j0yAUe5BG6yW5Uz0q8fICfoBfiWRzQqtd8e9gZkg9SgGsplvAnLL/
	 h0SmUegl/FQUlh8C7P9YYUuwo+Iua1kYDG/e/yWXJAxAZIBpOD3ZoekPMbwqG+IwVd
	 c7M470grJn5VLBCN6EsJVekDdMn6lkVahne/zwy9VkM7UweXNTW5atP35ekL+ywOau
	 IqZsR42PozLpTqtkaOcrbpRhDQ3rExDNpYFyc22kt9lj74V4qvbrqhkf+OPDsu5BAP
	 dDr1JAPEFz0jhdaA8gZJEb3K/yeFVQ1BSN/W00EeP4Ldwf/1u8hafSbyjmmo4JLrQ0
	 5b0c+GU1YTViyNA9Gb6MPzmbBKOzY94XuaNhGYVXIqCqlJQwsM0m0g+6FWqner9S5G
	 u+SvEChXqIQqVmHC9B6dd0eUrgNdaQLOvZc8DVO51uuMpI/mutqKoKRM4FLdFO5vWg
	 bmP3Wr0j3x9GqrL6Eva/FfRos6F1cnVzKERcg2n/NXK4giXX4aYXDoVrYQKSOlH9CP
	 X9slncHwmwTTkpH8JZX7HGBM=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso9314785e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017775; x=1792622575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
        b=2W3bNg39LDO1q6NjytZaI/XzSeLVshxlMM/zJmZ5/8nSuwPkExyVyFdkT8qmx3KxIz
         Js7gRZKJbWB1JRewANYgyT1ezrXyb5pJs9GJ8uNVDNskxyOUSYZHbI2MR4V3yE5hfKGl
         LuUjO3wCEBgBIfEqhMDDHDDidohTM+CxivuMjZHs6TOgyv7T7S88QUIJL6pv1xfhTlBl
         ZHqV6lnsjlWpAIoBmPecsObHbgbVueLq3gezpLYDO0cBDMxrir4YNs9gXxkENR2ChDeM
         EJA3VvB5mPi4SR+16dKYKuEd67vGBja+Ww0beTnZshvJe3d0g5mkqKD0Zo/zJMOr9aDf
         Y/4g==
X-Forwarded-Encrypted: i=1; AKwUvBz3U4Gys2B3ffmYCpBoPnEqGV+lx9Pw/sVIRe490GDJy1sGQRwNlsrWDNG52D0lJU5m7COAgKd6ac0=@lists.infradead.org
X-Gm-Message-State: AFq9FYKz8AmAf7oHoSi0nSbpyJ2Sfd9jFAp/KXq4zs2MYsqR7zHsT6xK
	yKPPQghsyGcpYa5kVQS6Eth8vi6fjTFoQim6FJ5NyM1wwh9oIxPbFKcdJDAjGCnJGHX8+6tgAtt
	APOKyUG+VmPA6WqEmcKObtt0uzvuNu0CzRBBOhOl3TkV3WGNEzbdMxwVJ9/bVBhy5J90QmzOpPC
	TNl1pN/GA=
X-Gm-Gg: AYBFou201oZKITtBxQNVmQ13RUq92ONq9d4C2HR7CaCbd86PUZ8+laaFKKO1p7T4v0W
	hZeel32x4R4wcaJirSL5F5VKlHhMUx26KZ29o8YxNJ5PoJSLeTZ+GiqetwcSaNY1aG6gPh15Dq5
	eMejCLYDVzTOB3ROozjh/ZDwxfmifxa5u8u5IrDPD45cSC/a+cmPxN3Ciyr9KW7enmIGIFRGOXG
	VfAz4+iSKvZZuqtqBXz1kw7xRSdu+4sb9GQvI/nbrpOaqzxDn+BBmcf0RZMmsbR36hXSRi0uXbx
	tj6DTGKpnB+VvmWes0z0LGOFiUsPML6kopwp6K97cRTb+h2YvP79/A7CdEPRsAF/xsX3cxGFk6k
	fShI+7kn4znQHpWlMtPS9vHl9YpjGBPiwj1pYvnwVFpKI1czMi+2TWZNy
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760855e9.6.1792017775549;
        Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760415e9.6.1792017774558;
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 2/2] KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs
Date: Thu, 15 Oct 2026 00:42:39 +0200
Message-ID: <20261014224239.963635-3-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_234257_628541_AB9D0B71 
X-CRM114-Status: GOOD (  10.14  )
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

KVM supports extensions Zicclsm, Ziccamoa, Ziccif, Za64rs for the guest.
Add these extensions to the get-reg-list test.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index bf3980e9db127..71e5969142b30 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -63,6 +63,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
@@ -89,6 +90,9 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
@@ -576,6 +580,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(SVVPTC),
+		KVM_ISA_EXT_ARR(ZA64RS),
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
@@ -602,6 +607,9 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
+		KVM_ISA_EXT_ARR(ZICCAMOA),
+		KVM_ISA_EXT_ARR(ZICCIF),
+		KVM_ISA_EXT_ARR(ZICCLSM),
 		KVM_ISA_EXT_ARR(ZICCRSE),
 		KVM_ISA_EXT_ARR(ZICFILP),
 		KVM_ISA_EXT_ARR(ZICFISS),
@@ -1238,6 +1246,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(za64rs, ZA64RS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
@@ -1264,6 +1273,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccamoa, ZICCAMOA);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccif, ZICCIF);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicclsm, ZICCLSM);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
@@ -1372,6 +1384,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svnapot,
 	&config_svpbmt,
 	&config_svvptc,
+	&config_za64rs,
 	&config_zaamo,
 	&config_zabha,
 	&config_zacas,
@@ -1398,6 +1411,9 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbom,
 	&config_zicbop,
 	&config_zicboz,
+	&config_ziccamoa,
+	&config_ziccif,
+	&config_zicclsm,
 	&config_ziccrse,
 	&config_zicfilp,
 	&config_zicfiss,
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
